`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 14:55:31
// Design Name: 
// Module Name: VIP_RGB888_YCbCr444
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


module VIP_RGB888_YCbCr444
(
	//global clock
	input				clk,  				//cmos video pixel clock
	input				rst_n,				//global reset

	//Image data prepred to be processd
	input				per_frame_vsync,	//Prepared Image data vsync valid signal
	input				per_frame_href,		//Prepared Image data href vaild  signal
	input               per_frame_clken,
	input		[23:0]	per_img_rgb888,		//Prepared Image rgb888 data to be processed
	
	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output 				post_frame_clken,
	output		[23:0]	post_img_gray
	
);

wire	[7:0]	per_img_red;		//Prepared Image red data to be processed
wire	[7:0]	per_img_green;		//Prepared Image green data to be processed
wire	[7:0]	per_img_blue;		//Prepared Image blue data to be processed

assign  per_img_red 	= per_img_rgb888[23:16];
assign  per_img_green	= per_img_rgb888[15:8];
assign  per_img_blue 	= per_img_rgb888[7:0];

wire	[7:0]	post_img_Y;			//Processed Image brightness output
wire	[7:0]	post_img_Cb;		//Processed Image blue shading output
wire	[7:0]	post_img_Cr;			//Processed Image red shading output

//--------------------------------------------
/*********************************************
//Refer to <OV7725 Camera Module Software Applicaton Note> page 5
	Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
	Cb 	=	(-43*R	- 	85 *G	+ 	128*B)>>8 + 128
	Cr 	=	(128*R 	-	107*G  	-	21 *B)>>8 + 128
--->
	Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
	Cb 	=	(-43*R	- 	85 *G	+ 	128*B + 32768)>>8
	Cr 	=	(128*R 	-	107*G  	-	21 *B + 32768)>>8
**********************************************/
//Step 1
reg	[15:0]	img_red_r0,		img_red_r1,		img_red_r2;	
reg	[15:0]	img_green_r0,	img_green_r1,	img_green_r2; 
reg	[15:0]	img_blue_r0,	img_blue_r1,	img_blue_r2; 

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		img_red_r0		<=	16'd0; 		
		img_red_r1		<=	16'd0; 		
		img_red_r2		<=	16'd0; 	
		img_green_r0	<=	16'd0; 		
		img_green_r1	<=	16'd0; 		
		img_green_r2	<=	16'd0; 	
		img_blue_r0		<=	16'd0; 		
		img_blue_r1		<=	16'd0; 		
		img_blue_r2		<=	16'd0; 			
	end
	else begin
		img_red_r0		<=	per_img_red 	* 	8'd77; 		
		img_red_r1		<=	per_img_red 	* 	8'd43; 	
		img_red_r2		<=	per_img_red 	* 	8'd128; 		
		img_green_r0	<=	per_img_green 	* 	8'd150; 		
		img_green_r1	<=	per_img_green 	* 	8'd85; 			
		img_green_r2	<=	per_img_green 	* 	8'd107; 
		img_blue_r0		<=	per_img_blue 	* 	8'd29; 		
		img_blue_r1		<=	per_img_blue 	* 	8'd128; 			
		img_blue_r2		<=	per_img_blue 	* 	8'd21; 		
	end
end

//--------------------------------------------------
//Step 2
reg	[15:0]	img_Y_r0;	
reg	[15:0]	img_Cb_r0; 
reg	[15:0]	img_Cr_r0; 

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		img_Y_r0	<=	16'd0; 		
		img_Cb_r0	<=	16'd0; 		
		img_Cr_r0	<=	16'd0; 	
	end
	else begin
		img_Y_r0	<=	img_red_r0 	+ 	img_green_r0 	+ 	img_blue_r0; 		
		img_Cb_r0	<=	img_blue_r1 - 	img_red_r1 		- 	img_green_r1	+	16'd32768; 		
		img_Cr_r0	<=	img_red_r2 	- 	img_green_r2 	- 	img_blue_r2		+	16'd32768; 		
	end
end

//--------------------------------------------------
//Step 3
reg	[7:0]	img_Y_r1;	
reg	[7:0]	img_Cb_r1; 
reg	[7:0]	img_Cr_r1; 

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		img_Y_r1	<=	0; 		
		img_Cb_r1	<=	0; 		
		img_Cr_r1	<=	0; 	
	end
	else begin
		img_Y_r1	<=	img_Y_r0[15:8];
		img_Cb_r1	<=	img_Cb_r0[15:8];
		img_Cr_r1	<=	img_Cr_r0[15:8]; 
	end
end

//------------------------------------------
//lag 3 clocks signal sync  
reg	[2:0]	per_frame_vsync_r;
reg	[2:0]	per_frame_href_r;	
reg	[2:0]	per_frame_clken_r;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		per_frame_vsync_r <= 0;
		per_frame_href_r <= 0;
		per_frame_clken_r  <=  0;
	end
	else begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[1:0], 	per_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[1:0], 	per_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[1:0], 	per_frame_clken};
	end
end

assign	post_frame_vsync 	= 	per_frame_vsync_r[2];
assign	post_frame_href 	= 	per_frame_href_r[2];
assign  post_frame_clken    = 	per_frame_clken_r[2];
assign	post_img_Y 	= 	post_frame_href ? img_Y_r1 : 8'd0;
assign	post_img_Cb =	post_frame_href ? img_Cb_r1: 8'd0;
assign	post_img_Cr = 	post_frame_href ? img_Cr_r1: 8'd0;

assign  post_img_gray = post_frame_href ? {post_img_Y, post_img_Y, post_img_Y} : 24'd0;

endmodule

