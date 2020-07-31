`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 13:56:41
// Design Name: 
// Module Name: capture_raw_data
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


module capture_raw_data
#(
	parameter	integer		CMOS_FRAME_WAITCNT	= 10		//Wait n fps for steady(OmniVision need 10 Frame)
)
(
	//global clocks
	input				clk_cmos,			//24MHz CMOS Driver clock input
	input				rst_n,				//global reset

	//CMOS Sensor Interface
	input				cmos_pclk,			//24MHz CMOS Pixel clock input
	output				cmos_xclk,			//24MHz drive clock
	input				cmos_vsync,			//H : Data Valid; L : Frame Sync(Set it by register)
	input				cmos_href,			//H : Data vaild, L : Line Sync
	output				cmos_rst_n,
	output				cmos_pwdn,
	input		[7:0]	cmos_data,			//8 bits cmos data input
	
	//CMOS SYNC Data output
	output				cmos_frame_vsync,	//cmos frame data vsync valid signal
	output				cmos_frame_href,	//cmos frame data href vaild  signal
	output		[7:0]	cmos_frame_data,	//cmos frame RAW output	
	
	output				cmos_frame_clk,
	output				cmos_frame_clken,	//cmos frame data output/capture enable clock, 12MHz

	output				usb_frame_vsync,	//cmos frame data vsync valid signal
	output				usb_frame_href,		//cmos frame data href vaild  signal
	output		[7:0]	usb_frame_data		//cmos frame RAW output
);

assign	cmos_xclk 	= clk_cmos;	//24MHz CMOS XCLK output
assign  cmos_rst_n 	= 1'b1;
assign  cmos_pwdn 	= 1'b0;

//-----------------------------------------------------
//Sensor HS & VS Vaild Capture
/**************************************************					       
         _________________________________
VS______|                                 |________
	            _______	 	     _______
HS_____________|       |__...___|       |____________
**************************************************/
//-------------------------------------------------------------
//sync the frame vsync and href signal and generate frame begin & end signal
reg	[1:0]	cmos_vsync_r, cmos_href_r;
reg	[7:0]	cmos_data_r0, cmos_data_r1;
always@(posedge cmos_pclk or negedge rst_n)begin
	if(!rst_n)begin
		cmos_vsync_r <= 2'd0;
		cmos_href_r <= 2'd0;
		{cmos_data_r1, cmos_data_r0} <= 8'd0;
	end
	else begin
		cmos_vsync_r <= {cmos_vsync_r[0], cmos_vsync};
		cmos_href_r <= {cmos_href_r[0], cmos_href};
		{cmos_data_r1, cmos_data_r0} <= {cmos_data_r0, cmos_data};
	end
end

wire 	cmos_vsync_end = (cmos_vsync_r == 2'b10);	

//----------------------------------------------------------------------------------
//Wait for Sensor output Data valid 10 Frame of OmniVision
reg	[3:0]	cmos_fps_cnt;
always@(posedge cmos_pclk or negedge rst_n)begin
	if(!rst_n)
		cmos_fps_cnt <= 4'd0;
	else begin	//Wait until cmos init complete
		if(cmos_fps_cnt < CMOS_FRAME_WAITCNT)	
			cmos_fps_cnt <= cmos_vsync_end ? cmos_fps_cnt + 1'b1 : cmos_fps_cnt;
		else
			cmos_fps_cnt <= CMOS_FRAME_WAITCNT;
	end
end

//----------------------------------------------------------------------------------
//Come ture frame synchronization to ignore error frame or has not capture when vsync begin
reg		frame_sync_flag;
always@(posedge cmos_pclk or negedge rst_n)begin
	if(!rst_n)
		frame_sync_flag <= 0;
	else if( (cmos_fps_cnt == CMOS_FRAME_WAITCNT) && cmos_vsync_end)
		frame_sync_flag <= 1;
	else
		frame_sync_flag <= frame_sync_flag;
end

assign	cmos_frame_vsync = frame_sync_flag ? cmos_vsync_r[1] : 1'b0;//DFF 2 clocks
assign	cmos_frame_href  = frame_sync_flag ? cmos_href_r[1] : 1'b0;	//DFF 2 clocks
assign	cmos_frame_data	 = frame_sync_flag ? cmos_data_r1 : 8'd0;	//DFF 2 clocks
assign	cmos_frame_clken = frame_sync_flag ? (cmos_frame_href) || (!cmos_frame_href) : 1'b0;
assign  cmos_frame_clk   = cmos_pclk; 

assign	usb_frame_vsync = frame_sync_flag ? cmos_vsync_r[1] : 1'b0;//DFF 2 clocks
assign	usb_frame_href  = frame_sync_flag ? cmos_href_r[1] : 1'b0;	//DFF 2 clocks
assign	usb_frame_data	= frame_sync_flag ? cmos_data_r1 : 8'd0;	//DFF 2 clocks

endmodule



