`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/03 18:11:34
// Design Name: 
// Module Name: VIP_Gray_Median_Filter
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


module VIP_Gray_Median_Filter
#(
	parameter	integer 	IMG_HDISP = 640,	//640*480
	parameter	integer		IMG_VDISP = 480
)
(
	//global clock
	input			clk,  				//100MHz
	input			rst_n,				//global reset

	//Image data prepred to be processd
	input			per_frame_vsync,	//Prepared Image data vsync valid signal
	input			per_frame_href,		//Prepared Image data href vaild  signal
	input           per_frame_clken,	//Prepared Image data output enable clock
	input	[23:0]	per_img_Gray,		//Prepared Image data 8 Bit gray Data
	
	//Image data has been processd
	output			post_frame_vsync,	//Processed Image data vsync valid signal
	output			post_frame_href,	//Processed Image data href vaild  signal
	output 			post_frame_clken,	//Processed Image data output enable clock
	output	[23:0]	post_img_Gray		//Processed Image data 8 Bit gray Data
);


//----------------------------------------------------
//Generate 8Bit 3X3 Matrix for Video Image Processor.
wire		matrix_frame_vsync;	//Prepared Image data vsync valid signal
wire		matrix_frame_href;	//Prepared Image data href vaild  signal
wire		matrix_frame_clken;	//Prepared Image data output enable clock	
wire [7:0]	matrix_p11, matrix_p12, matrix_p13;	//3X3 Matrix output
wire [7:0]	matrix_p21, matrix_p22, matrix_p23;
wire [7:0]	matrix_p31, matrix_p32, matrix_p33;

VIP_Matrix_Generate_3x3_8Bit_v2	
#(
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
u_VIP_Matrix_Generate_3x3_8Bit_v2
(
	//global clock
	.clk					(clk),  				
	.rst_n					(rst_n),				

	//Image data prepred to be processd
	.per_frame_vsync		(per_frame_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href			(per_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken        (per_frame_clken),		//Prepared Image data output enable clock
	.per_img_Gray			(per_img_Gray[7:0]),	//Prepared Image brightness input

	//Image data has been processd
	.matrix_frame_vsync		(matrix_frame_vsync),	//Processed Image data vsync valid signal
	.matrix_frame_href		(matrix_frame_href),	//Processed Image data href vaild  signal
	.matrix_frame_clken     (matrix_frame_clken),	//Processed Image data output enable clock
	.matrix_p11(matrix_p11),	.matrix_p12(matrix_p12), 	.matrix_p13(matrix_p13),	//3X3 Matrix output
	.matrix_p21(matrix_p21), 	.matrix_p22(matrix_p22), 	.matrix_p23(matrix_p23),
	.matrix_p31(matrix_p31), 	.matrix_p32(matrix_p32), 	.matrix_p33(matrix_p33)
);


//----------------------------------------------------------------------------
//Median Filter of 3X3 datas, need 3 clock
wire [7:0]	mid_value;
Median_Filter_3X3	u_Median_Filter_3X3
(
	.clk			(clk),
	.rst_n			(rst_n),
	
	//ROW1
	.data11			(matrix_p11), 
	.data12			(matrix_p12), 
	.data13			(matrix_p13),
	//ROW2	
	.data21			(matrix_p21), 
	.data22			(matrix_p22), 
	.data23			(matrix_p23),
	//ROW3	
	.data31			(matrix_p31), 
	.data32			(matrix_p32), 
	.data33			(matrix_p33),
	
	.target_data	(mid_value)
);


//------------------------------------------
//lag 3 clocks signal sync  
reg	[2:0]	per_frame_vsync_r;
reg	[2:0]	per_frame_href_r;
reg	[2:0]	per_frame_clken_r;	

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		per_frame_vsync_r <= 3'd0;
		per_frame_href_r  <= 3'd0;
		per_frame_clken_r <= 3'd0;
		end
	else begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[1:0], 	matrix_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[1:0], 	matrix_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[1:0], 	matrix_frame_clken};
		end
end

assign	post_frame_vsync 	= 	per_frame_vsync_r[2];
assign	post_frame_href 	= 	per_frame_href_r[2];
assign	post_frame_clken 	= 	per_frame_clken_r[2];
assign	post_img_Gray		=	post_frame_href ? {mid_value, mid_value, mid_value} : 24'd0;

endmodule
