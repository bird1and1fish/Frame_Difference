`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 22:27:16
// Design Name: 
// Module Name: Video_Image_Simulate_CMOS
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


module Video_Image_Simulate_CMOS
#(
	parameter	integer		CMOS_VSYNC_VALID	= 1,		//H : Data Valid; L : Frame Sync(Set it by register)
	parameter	integer		IMG_HDISP 			= 640,	//640*480
	parameter	integer		IMG_VDISP 			= 480
)
(
	//global reset
	input				rst_n,		
	
	//CMOS Camera interface and data output simulation
	input				cmos_xclk,			//cmos driver clock
	output				cmos_pclk,			//25MHz when rgb output, 12.5MHz when raw output
	output				cmos_vsync,			//L: vaild, H: invalid
	output	reg			cmos_href,			//H: vaild, L: invalid
	output	reg	[7:0]	cmos_data			//8 bits cmos data input
);
wire	clk		=	cmos_xclk;
// wire	rst_n 	= 	1'b1;

//------------------------------------------
//generate cmos timing
/*
localparam H_SYNC = 11'd80;
localparam H_BACK = 11'd45;
localparam H_DISP = IMG_HDISP;	//11'd640
localparam H_FRONT = 11'd19;
localparam H_TOTAL = H_SYNC + H_BACK + H_DISP + H_FRONT;	//10'd784

localparam V_SYNC = 11'd3;
localparam V_BACK = 11'd17;
localparam V_DISP = IMG_VDISP;	//11'd480
localparam V_FRONT = 11'd10;
localparam V_TOTAL = V_SYNC + V_BACK + V_DISP + V_FRONT;	//10'd510
*/
//Just for simulation
localparam H_SYNC = 11'd5;		
localparam H_BACK = 11'd5;		
localparam H_DISP = IMG_HDISP;	
localparam H_FRONT = 11'd5;		
localparam H_TOTAL = H_SYNC + H_BACK + H_DISP + H_FRONT;	//10'd784

localparam V_SYNC = 11'd1;		
localparam V_BACK = 11'd0;		
localparam V_DISP = IMG_VDISP;	
localparam V_FRONT = 11'd1;		
localparam V_TOTAL = V_SYNC + V_BACK + V_DISP + V_FRONT;	//10'd510


//----------------------------------
////25MHz when rgb output, 12.5MHz when raw output
reg		pixel_cnt;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		pixel_cnt <= 0;
	else 
		pixel_cnt <= pixel_cnt + 1'b1;
end
wire	pixel_flag	=	1'b1;
assign	cmos_pclk	= 	~clk;
						
						
						
//---------------------------------------------
//Horizontal counter
reg	[10:0]	hcnt;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		hcnt <= 11'd0;
	else if(pixel_flag)
		hcnt <= (hcnt < H_TOTAL - 1'b1) ? hcnt + 1'b1 : 11'd0;
	else
		hcnt <= hcnt;
end

//---------------------------------------------
//Vertical counter
reg	[10:0]	vcnt;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		vcnt <= 11'd0;		
	else if(pixel_flag)
		begin
		if(hcnt == H_TOTAL - 1'b1)
			vcnt <= (vcnt < V_TOTAL - 1'b1) ? vcnt + 1'b1 : 11'd0;
		else
			vcnt <= vcnt;
		end
	else
		vcnt <= vcnt;
end

//---------------------------------------------
//Image data vsync valid signal
reg	cmos_vsync_r;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cmos_vsync_r <= 1'b0;			//H: Vaild, L: inVaild
	else if(pixel_flag)
		begin
		if(vcnt <= V_SYNC - 1'b1)
			cmos_vsync_r <= 1'b0; 	//H: Vaild, L: inVaild
		else
			cmos_vsync_r <= 1'b1; 	//H: Vaild, L: inVaild
		end
	else
		cmos_vsync_r <= cmos_vsync_r;
end
assign	cmos_vsync	=	(CMOS_VSYNC_VALID	== 1'b0) ? ~cmos_vsync_r :	cmos_vsync_r;


//---------------------------------------------
//Image data href vaild  signal
wire	frame_valid_ahead = ((vcnt >= V_SYNC + V_BACK  && vcnt < V_SYNC + V_BACK + V_DISP &&
						hcnt >= H_SYNC + H_BACK  && hcnt < H_SYNC + H_BACK + H_DISP)) 
						? 1'b1 : 1'b0;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cmos_href <= 0;
	else if(pixel_flag) 
		begin
		if(frame_valid_ahead)
			cmos_href <= 1;
		else
			cmos_href <= 0;
		end
	else
		cmos_href <= cmos_href;
end

//---------------------------------------------
//CMOS Camera data output
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cmos_data <= 16'd0;
	else if(pixel_flag)
		begin
		if(frame_valid_ahead)
			//cmos_data <= hcnt[7:0] - (8'd10 - 8'd1);
			cmos_data <= {$random}%10;
		else
			cmos_data <= 0;
		end
	else
		cmos_data <= cmos_data;
end

endmodule


