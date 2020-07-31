`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 13:34:19
// Design Name: 
// Module Name: matrix_generate_3x3_8bit_v2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VIP_Matrix_Generate_3x3_8Bit_v2
#(
	parameter	integer	IMG_HDISP = 640,	//640*480
	parameter	integer	IMG_VDISP = 480
)
(
	//global clock
	input				clk,  				//cmos video pixel clock
	input				rst_n,				//global reset

	//Image data prepred to be processd
	input				per_frame_vsync,	//Prepared Image data vsync valid signal
	input				per_frame_href,		//Prepared Image data href vaild  signal
	input				per_frame_clken,
	input		[7:0]	per_img_Gray,		//Prepared Image brightness input

	//Image data has been processd
	output				matrix_frame_vsync,	//Prepared Image data vsync valid signal
	output				matrix_frame_href,	//Prepared Image data href vaild  signal
	output				matrix_frame_clken,

	output	reg	[7:0]	matrix_p11, matrix_p12, matrix_p13,	//3X3 Matrix output
	output	reg	[7:0]	matrix_p21, matrix_p22, matrix_p23,
	output	reg	[7:0]	matrix_p31, matrix_p32, matrix_p33
);


//---------------------------------------------------------------------
//generate last href 
wire 		read_frame_href;
reg [10:0]	pixel_cnt;
reg [14:0] 	row_cnt;
reg [14:0] 	cnt0, cnt1, cnt2;

reg 		matrix_frame_last_href;
reg [1:0]	read_frame_last_href_r;
reg 		read_frame_last_href;
reg [2:0]	matrix_frame_last_href_r;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		row_cnt <= 15'd0;
	else if(read_frame_href)begin	
		if(row_cnt < IMG_VDISP)begin
			if(pixel_cnt == IMG_HDISP)
				row_cnt <= row_cnt + 1'b1;
			else	
				row_cnt <= row_cnt;
		end
	end
	else if(per_frame_vsync == 1'b0)
		row_cnt <= 15'd0;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt0 <= 15'd0;
	else if((read_frame_href == 1'b0) && (row_cnt == IMG_VDISP - 1))
		cnt0 <= cnt0 + 1'b1;
	else if(row_cnt === 1'b0)
		cnt0 <= 15'd0;
	else
		cnt0 <= cnt0;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt1 <= 15'd0;
	else if(read_frame_href && (row_cnt == IMG_VDISP - 1))
		cnt1 <= cnt1 + 1'b1;
	else if(row_cnt === 1'b0)
		cnt1 <= 15'd0;
	else 
		cnt1 <= cnt1;
end
	
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt2 <= 15'd0;
	else if(row_cnt == IMG_VDISP)
		cnt2 <= cnt2 + 1'b1;
	else if(row_cnt === 1'b0)
		cnt2 <= 15'd0;
	else 
		cnt2 <= cnt2;
end
	
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		read_frame_last_href <= 1'b0;
	else if(row_cnt == IMG_VDISP)begin
			if(cnt2 >= (cnt0 + cnt1 - 1))
				read_frame_last_href <= 1'b0;
			else if(cnt2 >= (cnt0 - 1))
				read_frame_last_href <= 1'b1;
	end
end	

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		matrix_frame_last_href <= 1'b0;
	else if(row_cnt == IMG_VDISP)begin
			if(cnt2 >= (cnt0 + cnt1 - 2))
				matrix_frame_last_href <= 1'b0;
			else if(cnt2 >= (cnt0 - 1))
				matrix_frame_last_href <= 1'b1;
	end
end	

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		read_frame_last_href_r <= 2'd0;
	else 
		read_frame_last_href_r <= {read_frame_last_href_r[0], read_frame_last_href};
end	

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		matrix_frame_last_href_r <= 3'd0;
	else 
		matrix_frame_last_href_r <= {matrix_frame_last_href_r[1:0], matrix_frame_last_href};
end	

//--------------------------------------------------------------------------
//Generate 3*3 matrix 
//sync row3_data with per_frame_clken & row1_data & raw2_data
wire [7:0]	row1_data;	//frame data of the 1th row
wire [7:0]	row2_data;	//frame data of the 2th row
reg	 [7:0]	row3_data;	//frame data of the 3th row

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		row3_data <= 0;
	else begin
		if(per_frame_href)
			row3_data <= per_img_Gray;
		else
			row3_data <= row3_data;
	end	
end

//module of shift ram for raw data
wire shift_clk_en, clr;
assign  shift_clk_en = per_frame_href | matrix_frame_last_href;
assign  clr = (row_cnt == 1'b0)?1'b1:1'b0;

shift_ram_3x3_8bit u0_shift_ram_3x3_8bit (
	.D 		(row3_data),        	// input wire [7 : 0] D
	.CLK 	(clk),   		 	// input wire CLK
	.CE 	(shift_clk_en),   	// input wirmate CE
	.SCLR 	(clr),  			// input wire SCLR
	.Q 		(row2_data)      		// output wire [7 : 0] Q
);

shift_ram_3x3_8bit u1_shift_ram_3x3_8bit (
	.D 		(row2_data),       	// input wire [7 : 0] D
	.CLK 	(clk),    			// input wire CLK
	.CE 	(shift_clk_en),     // input wire CE
	.SCLR 	(clr),  			// input wire SCLR
	.Q 		(row1_data)        	// output wire [7 : 0] Q
);


//----------------------------------------------------------------------------
/******************************************************************************
					----------	Convert Matrix	----------
				[ P31 -> P32 -> P33 -> ]	--->	[ P11 P12 P13 ]	
				[ P21 -> P22 -> P23 -> ]	--->	[ P21 P22 P23 ]
				[ P11 -> P12 -> P11 -> ]	--->	[ P31 P32 P33 ]
******************************************************************************/
/***********************************************
	(1)	Read data from Shift_RAM
	(2) Caculate the Sobel
	(3) Steady data after Sobel generate
************************************************/
reg	[7:0]	row1_data0, row1_data1, row2_data0, row2_data1, row3_data0, row3_data1;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin//第一和第二行的像素点都不能参与运算，从第三行的第二个像素点开始，通过镜像可以构成3x3，第三行							
		pixel_cnt <= 0;//的第一个像素点不能运行，第三行的最后一个像素点也是镜像，一直到最后一行都是如此
		row1_data0 <= 0; row1_data1 <= 0;
		row2_data0 <= 0; row2_data1 <= 0;
		row3_data0 <= 0; row3_data1 <= 0;
		{matrix_p11, matrix_p12, matrix_p13} <= 24'd0;
		{matrix_p21, matrix_p22, matrix_p23} <= 24'd0;
		{matrix_p31, matrix_p32, matrix_p33} <= 24'd0;
	end
	else if(read_frame_href)begin
			pixel_cnt <= (pixel_cnt < IMG_HDISP) ? pixel_cnt + 1'b1 : 11'd0;	//Point Counter
			{row1_data1, row1_data0} <= {row1_data0, row1_data};
			{row2_data1, row2_data0} <= {row2_data0, row2_data};
			{row3_data1, row3_data0} <= {row3_data0, row3_data};
			if(pixel_cnt == 1'b0)begin
				{matrix_p11, matrix_p12, matrix_p13} <= 0;
				{matrix_p21, matrix_p22, matrix_p23} <= 0;
				{matrix_p31, matrix_p32, matrix_p33} <= 0;
			end
			else if(pixel_cnt == 1'b1)begin			//First point	
					if(row_cnt == 1'b1)begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row3_data, row3_data0, row3_data};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data, row2_data0, row2_data};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data, row3_data0, row3_data};
					end
					else if(row_cnt == IMG_VDISP )begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data, row1_data0, row1_data};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data, row2_data0, row2_data};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row1_data, row1_data0, row1_data};
					end
					else begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data, row1_data0, row1_data};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data, row2_data0, row2_data};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data, row3_data0, row3_data};
					end		
			end
			else if(pixel_cnt == IMG_HDISP)begin	//Last Point			
					if(row_cnt == 1'b1)begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row3_data1, row3_data, row3_data1};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data, row2_data1};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data1, row3_data, row3_data1};
					end
					else if(row_cnt == IMG_VDISP )begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data1, row1_data, row1_data1};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data, row2_data1};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row1_data1, row1_data, row1_data1};
					end
					else begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data1, row1_data,	row1_data1};
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data,	row2_data1};
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data1, row3_data,	row3_data1};
					end
			end
			else begin							//2 ~ IMG_HDISP-1 Point
					if(row_cnt == 1'b1)begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row3_data1, row3_data0, row3_data};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data0, row2_data};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data1, row3_data0, row3_data};
					end
					else if(row_cnt == IMG_VDISP )begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data1, row1_data0, row1_data};			
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data0, row2_data};	
						{matrix_p31, matrix_p32, matrix_p33} <= {row1_data1, row1_data0, row1_data};
					end
					else begin
						{matrix_p11, matrix_p12, matrix_p13} <= {row1_data1, row1_data0, row1_data};
						{matrix_p21, matrix_p22, matrix_p23} <= {row2_data1, row2_data0, row2_data};
						{matrix_p31, matrix_p32, matrix_p33} <= {row3_data1, row3_data0, row3_data};
					end
			end
	end
	else begin
		pixel_cnt <= 11'd0;
		{matrix_p11, matrix_p12, matrix_p13} <= 24'd0;
		{matrix_p21, matrix_p22, matrix_p23} <= 24'd0;
		{matrix_p31, matrix_p32, matrix_p33} <= 24'd0;
	end
end

//------------------------------------------
//lag 3 clocks signal sync  
reg [2:0]	per_frame_vsync_r;
reg	[2:0]	per_frame_href_r;	
reg	[2:0]	per_frame_clken_r;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
		per_frame_vsync_r 	<= 3'd0;
		per_frame_href_r 	<= 3'd0;
		per_frame_clken_r 	<= 3'd0;
	end
	else begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[1:0], 	per_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[1:0], 	per_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[1:0], 	per_frame_clken};
	end
end

assign  read_frame_href		=	per_frame_href_r[0] | per_frame_href_r[1] | read_frame_last_href_r[0];	
assign	matrix_frame_vsync 	= 	per_frame_vsync_r[2];
assign	matrix_frame_href 	= 	per_frame_href_r[2] | matrix_frame_last_href_r[2];
assign	matrix_frame_clken  = 	per_frame_clken_r[2];

endmodule


