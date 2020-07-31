`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/06 20:38:04
// Design Name: 
// Module Name: Video_Image_Processor
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


module Video_Image_Processor
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
	input		[7:0]	per_img_RAW,		//Prepared Image data of YCbCr 4:2:2 {CbY} {CrY}

	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output		[23:0]	post_img_Gray		//Processed Image Gray output
);

//-------------------------------------
//Convert the RAW format to RGB888 format.
wire				per_frame_clken;
wire				post1_frame_vsync;	//Processed Image data vsync valid signal
wire				post1_frame_href;	//Processed Image data href vaild  signal
wire 				post1_frame_clken;
wire	[23:0]		post1_img_rgb888;
VIP_RAW8_RGB888_v2_0 u_VIP_RAW8_RGB888_v2_0 
(
	.clk 				(clk),                            // input wire clk
	.rst_n 				(rst_n),                        // input wire rst_n

	.per_frame_vsync 	(per_frame_vsync),    // input wire per_frame_vsync
	.per_frame_href 	(per_frame_href),      // input wire per_frame_href
	.per_frame_clken 	(per_frame_clken),    				// input wire per_frame_clken
	.per_img_RAW 		(per_img_RAW),            // input wire [7 : 0] per_img_RAW

	.post_frame_vsync 	(post1_frame_vsync),  // output wire post_frame_vsync
	.post_frame_href 	(post1_frame_href),    // output wire post_frame_href
	.post_frame_clken 	(post1_frame_clken),  				// output wire post_frame_clken
	.post_img_rgb888 	(post1_img_rgb888)    // output wire [23 : 0] post_img_rgb888
);

//-------------------------------------
//Convert the RGB888 format to YCbCr444 format.
wire				post2_frame_vsync;	//Processed Image data vsync valid signal
wire				post2_frame_href;	//Processed Image data href vaild  signal
wire 				post2_frame_clken;
wire	[23:0]		post2_img_gray;
VIP_RGB888_YCbCr444_0 u_VIP_RGB888_YCbCr444_0 (
	.clk 				(clk),                            // input wire clk
	.rst_n 				(rst_n),                        // input wire rst_n

	.per_frame_vsync 	(post1_frame_vsync),    // input wire per_frame_vsync
	.per_frame_href 	(post1_frame_href),      // input wire per_frame_href
	.per_frame_clken 	(post1_frame_clken),    // input wire per_frame_clken
	.per_img_rgb888 	(post1_img_rgb888),      // input wire [23 : 0] per_img_rgb888

	.post_frame_vsync 	(post2_frame_vsync),  // output wire post_frame_vsync
	.post_frame_href 	(post2_frame_href),    // output wire post_frame_href
	.post_frame_clken 	(post2_frame_clken),  // output wire post_frame_clken
	.post_img_gray 		(post2_img_gray)        // output wire [23 : 0] post_img_gray
);

//------------------------------------------------
wire				post3_frame_vsync;	//Processed Image data vsync valid signal
wire				post3_frame_href;	//Processed Image data href vaild  signal
wire 				post3_frame_clken;
wire	[23:0]		post3_img_gray;
VIP_Gray_Median_Filter_0 u_VIP_Gray_Median_Filter_0 (
	.clk 				(clk),                            // input wire clk
	.rst_n 				(rst_n),                        // input wire rst_n

	.per_frame_vsync 	(post2_frame_vsync),    // input wire per_frame_vsync
	.per_frame_href 	(post2_frame_href),      // input wire per_frame_href
	.per_frame_clken 	(post2_frame_clken),    // input wire per_frame_clken
	.per_img_Gray 		(post2_img_gray),          // input wire [23 : 0] per_img_Gray

	.post_frame_vsync 	(post3_frame_vsync),  // output wire post_frame_vsync
	.post_frame_href 	(post3_frame_href),    // output wire post_frame_href
	.post_frame_clken 	(post3_frame_clken),  // output wire post_frame_clken
	.post_img_Gray 		(post3_img_gray)        // output wire [23 : 0] post_img_Gray
);

assign	post_frame_vsync = post3_frame_vsync;		//Processed Image data vsync valid signal
assign	post_frame_href  = post3_frame_href;		//Processed Image data href vaild  signal
assign	post_img_Gray    = post3_img_gray;		//Processed Image Gray output	

endmodule
