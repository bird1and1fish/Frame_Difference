`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/14 20:51:54
// Design Name: 
// Module Name: VIP_Gray_Median_Filter_tb
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


module VIP_Gray_Median_Filter_tb();
//------------------------------------------
//Generate 24MHz driver clock
localparam CLK_PERIOD = 41; 			//摄像头pclk时钟，24MHz
reg clk;
initial clk = 0;
	always #(CLK_PERIOD/2) clk = ~clk;

//------------------------------------------
//Generate global reset
reg	rst_n;
task task_rst;
begin
	rst_n = 0;
	#(CLK_PERIOD * 20 + 1);
	rst_n = 1;
end
endtask

//-----------------------------------------
//CMOS Camera interface and data output simulation
wire		clk_cmos = clk;			//24MHz
wire		cmos_xclk;				//24MHz drive clock
wire		cmos_pclk;				//24MHz CMOS Pixel clock input
wire		cmos_vsync;				//L: vaild, H: invalid
wire		cmos_href;				//H: vaild, L: invalid
wire [7:0]	cmos_data;				//8 bits cmos data input
Video_Image_Simulate_CMOS	
#(
	.CMOS_VSYNC_VALID	(1),     //VSYNC = 1
	.IMG_HDISP			(10),	//(10'd640),	//640*480
	.IMG_VDISP			(8)		//(10'd480)
)
u_Video_Image_Simulate_CMOS
(
	//global reset
	.rst_n			(rst_n),	
	
	//CMOS Camera interface and data output simulation
	.cmos_xclk 		(clk_cmos),			//24MHz cmos clock
	.cmos_pclk		(cmos_pclk),		//24MHz when rgb output
	.cmos_vsync		(cmos_vsync),		//L: vaild, H: invalid
	.cmos_href		(cmos_href),		//H: vaild, L: invalid
	.cmos_data		(cmos_data)			//8 bits cmos data input
);

//--------------------------------------------------------------------------------------
//cmos video image capture
wire		cmos_frame_vsync;	//cmos frame data vsync valid signal
wire		cmos_frame_href;	//cmos frame data href vaild  signal
wire		cmos_frame_clken;
wire [7:0]	cmos_frame_RAW;		//cmos frame data output: 8 Bit raw data
wire [7:0]	cmos_fps_rate;		//cmos image output rate
CMOS_Capture_RAW_Gray	
#(
	.CMOS_FRAME_WAITCNT (4'd1)				//Wait n fps for steady(OmniVision need 10 Frame)
)
u_CMOS_Capture_RAW_Gray
(
	//global clock
	.clk_cmos			(clk_cmos),			//24MHz CMOS Driver clock input
	.rst_n				(rst_n),			//global reset

	//CMOS Sensor Interface
	.cmos_pclk			(cmos_pclk),  		//24MHz CMOS Pixel clock input
	.cmos_xclk			(cmos_xclk),		//24MHz drive clock
	.cmos_data			(cmos_data),		//8 bits cmos data input
	.cmos_vsync			(cmos_vsync),		//L: vaild, H: invalid
	.cmos_href			(cmos_href),		//H: vaild, L: invalid
	
	//CMOS SYNC Data output
	.cmos_frame_vsync	(cmos_frame_vsync),	//cmos frame data vsync valid signal
	.cmos_frame_href	(cmos_frame_href),	//cmos frame data href vaild  signal
	.cmos_frame_clken	(cmos_frame_clken),
	.cmos_frame_data	(cmos_frame_RAW),	//cmos frame data output: 8 Bit raw data	
	
	//user interface
	.cmos_fps_rate		(cmos_fps_rate)		//cmos image output rate
);

//------------------------------------------------------
//VIP process
wire		per_frame_vsync	=	cmos_frame_vsync;	//Prepared Image data vsync valid signal
wire		per_frame_href	=	cmos_frame_href;	//Prepared Image data href vaild  signal
wire		per_frame_clken = 	cmos_frame_clken;
wire [23:0]	per_img_Gray	= 	{cmos_frame_RAW, cmos_frame_RAW, cmos_frame_RAW};

wire		post_frame_vsync;	//Prepared Image data vsync valid signal
wire		post_frame_href;	//Prepared Image data href vaild  signal
wire		post_frame_clken;
wire [23:0]	post_img_Gray;

VIP_Gray_Median_Filter
#(
	.IMG_HDISP (10),	
	.IMG_VDISP (8)		
)
u_VIP_Gray_Median_Filter
(
	//global clock
	.clk 				(clk),  				
	.rst_n				(rst_n),				

	//Image data prepred to be processd
	.per_frame_vsync	(per_frame_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href		(per_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken	(per_frame_clken),
	.per_img_Gray		(per_img_Gray),			//Prepared Image brightness input
	
	//Image data has been processd
	.post_frame_vsync	(post_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href	(post_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken	(post_frame_clken),
	.post_img_Gray		(post_img_Gray)			//Processed Image brightness input
);

initial begin
	task_rst;
	#35000
	$stop;

end

endmodule
