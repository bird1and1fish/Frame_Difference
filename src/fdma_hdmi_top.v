`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/04 18:19:51
// Design Name: 
// Module Name: fdma_hdmi_top
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


module fdma_hdmi_top
(  
	inout [14:0]DDR_addr,
	inout [2:0]DDR_ba,
	inout DDR_cas_n,
	inout DDR_ck_n,
	inout DDR_ck_p,
	inout DDR_cke,
	inout DDR_cs_n,
	inout [3:0]DDR_dm,
	inout [31:0]DDR_dq,
	inout [3:0]DDR_dqs_n,
	inout [3:0]DDR_dqs_p,
	inout DDR_odt,
	inout DDR_ras_n,
	inout DDR_reset_n,
	inout DDR_we_n,
	inout FIXED_IO_ddr_vrn,
	inout FIXED_IO_ddr_vrp,
	inout [53:0]FIXED_IO_mio,
	inout FIXED_IO_ps_clk,
	inout FIXED_IO_ps_porb,
	inout FIXED_IO_ps_srstb,

	output 			led,
	input			key0,
	input			key1,
	input 			key3,
	//cmos interface
	output			cmos_sclk,		//cmos i2c clock
	inout			cmos_sdat,		//cmos i2c data
	input			cmos_pclk,		//cmos pxiel clock
	output			cmos_xclk,		//cmos externl clock
	input			cmos_vsync,		//cmos vsync
	input			cmos_href,		//cmos hsync refrence
	input	[7:0]	cmos_data,		//cmos data
	output			cmos_rst_n,		//Sensor Ctrl0
	output			cmos_pwdn,		//Sensor Ctrl1

	//---------------hdmi--------------------------
    output       tmds_clk_p,    // TMDS 时钟通道
    output       tmds_clk_n,
    output [2:0] tmds_data_p,   // TMDS 数据通道
    output [2:0] tmds_data_n
);

//--------------------------------------clock----------------------------
wire 	clk_100m;
wire 	ui_rstn;
wire	locked;
wire	clk_hdmi;		//hdmi clock
wire	clk_hdmi_5x;	//hdmi_x5 clock
wire 	clk_cmos;
sys_clk_ctrl u_sys_clk_ctrl
(    
	.clk_in1 	(clk_100m),
	.resetn 	(ui_rstn), 		// input resetn
    .locked 	(locked),       // output locked

    .clk_out1	(clk_hdmi),     // output clk_out1
    .clk_out2	(clk_hdmi_5x),     // output clk_out2
    .clk_out3	(clk_cmos)     // output clk_out3
);  

//-------------------------------cmos-----------------------------
assign led = i2c_config_done;
wire 	i2c_config_done;
cmos_init u_cmos_init
(
	.Clk           		(clk_cmos),
	.Rst_n         		(locked),

	.Init_Done     		(i2c_config_done),
	.cmos_rst_n    		(cmos_rst_n),
	.cmos_pwdn			(cmos_pwdn),
	.i2c_sclk      		(cmos_sclk),
	.i2c_sdat      		(cmos_sdat)
);

reg i2c_config_done_r, i2c_config_done_rr;
always @(posedge cmos_pclk) begin
	i2c_config_done_r <= i2c_config_done;
	i2c_config_done_rr <= i2c_config_done_r;
end

wire			cmos_init_done = i2c_config_done_rr;	///cmos camera init done
wire			cmos_frame_vsync;	//cmos frame data vsync valid signal
wire			cmos_frame_href;	//cmos frame data href vaild  signal
wire	[7:0]	cmos_frame_RAW;		//cmos frame data output: {cmos_data[7:0]<<8, cmos_data[7:0]}	
wire	[7:0]	cmos_fps_rate;		//cmos image output rate
CMOS_Capture_RAW_Gray	
#(
	.CMOS_FRAME_WAITCNT		(10),				//Wait n fps for steady(OmniVision need 10 Frame)
    .CLOCK_CMOS             (24000000)
)
u_CMOS_Capture_RAW_Gray
(
	//global clock
	.clk_cmos				(clk_cmos),			//24MHz CMOS Driver clock input
	.rst_n					(locked & cmos_init_done),	//global reset

	//CMOS Sensor Interface
	.cmos_pclk				(cmos_pclk),  		//24MHz CMOS Pixel clock input
	.cmos_xclk				(cmos_xclk),		//24MHz drive clock
	.cmos_data				(cmos_data),		//8 bits cmos data input
	.cmos_vsync				(cmos_vsync),		//L: vaild, H: invalid
	.cmos_href				(cmos_href),		//H: vaild, L: invalid
	
	//CMOS SYNC Data output
	.cmos_frame_vsync		(cmos_frame_vsync),	//cmos frame data vsync valid signal
	.cmos_frame_href		(cmos_frame_href),	//cmos frame data href vaild  signal
	.cmos_frame_data		(cmos_frame_RAW),	//cmos frame data output: 8 Bit raw data
	
	//user interface
	.cmos_fps_rate			(cmos_fps_rate)		//cmos image output rate
);



//----------------------------------------------------
//Video Image processor module.
//Image data prepred to be processd
wire			per_frame_vsync	=	cmos_frame_vsync;	//Prepared Image data vsync valid signal
wire			per_frame_href	=	cmos_frame_href;	//Prepared Image data href vaild  signal
wire	[7:0]	per_img_RAW		=	cmos_frame_RAW;		//Prepared Image data 8 Bit RAW Data

wire			post_frame_vsync;	//Processed Image data vsync valid signal
wire			post_frame_href;	//Processed Image data href vaild  signal
wire	[23:0]	post_img_Gray;		//Processed Image Gray output
Video_Image_Processor	
#(
	.IMG_HDISP	(640),	//640*480
	.IMG_VDISP	(480)
)
u_Video_Image_Processor
(
	//global clock
	.clk					(cmos_pclk),  			//cmos video pixel clock
	.rst_n					(locked),			//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(per_frame_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href			(per_frame_href),		//Prepared Image data href vaild  signal
	.per_img_RAW			(per_img_RAW),			//Prepared Image data 8 Bit RAW Data

	//Image data has been processd
	.post_frame_vsync		(post_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href		(post_frame_href),		//Processed Image data href vaild  signal
	.post_img_Gray			(post_img_Gray)			//Processed Image Red output
);

//----------------------------frame difference--------------------------------
//Register for VSYNC  count
reg	post_frame_vsync_r1, post_frame_vsync_r0;
always@(posedge cmos_pclk or negedge locked)begin
	if(!locked)begin
		post_frame_vsync_r1 <= 1'b0;
		post_frame_vsync_r0 <= 1'b0;
	end
	else begin
		post_frame_vsync_r1 <= post_frame_vsync_r0;
		post_frame_vsync_r0 <= post_frame_vsync;
	end
end

wire	frame_vsync_end = (post_frame_vsync_r1 & ~post_frame_vsync_r0) ? 1'b1 : 1'b0;

//Count for even or old frame
reg [1:0] frame_cnt;
always@(posedge cmos_pclk or negedge locked)begin
	if(!locked)
		frame_cnt <= 2'd0;
	else if(frame_vsync_end)	//Line valid
		frame_cnt <= (frame_cnt < 2) ? frame_cnt + 1'b1 : 1'b0;
	else
		frame_cnt <= frame_cnt;
end

//---------------fdma0 buf controller---------------------------  
parameter DDR_BASE0 = 32'h0100_0000;

wire  W0_FS_i = post_frame_vsync;
wire  W0_wclk_i = cmos_pclk;
wire  W0_wren_i = (frame_cnt == 2'd0) ? post_frame_href : 1'b0;
wire [31:0] W0_data_i = {8'd0, post_img_Gray};

wire  R0_FS_i = video_vs;
wire  R0_rclk_i = clk_hdmi;
wire  R0_rden_i = lcd_req_left;
wire  [31:0] R0_data_o; 

wire pkg_wr_areq_0;
wire pkg_wr_en_0;
wire pkg_wr_last_0;
wire [31:0] pkg_wr_addr_0;
wire [127:0] pkg_wr_data_0;
wire [31:0] pkg_wr_size_0;

wire pkg_rd_areq_0;
wire pkg_rd_en_0;
wire pkg_rd_last_0;
wire [31:0] pkg_rd_addr_0;
wire [127:0] pkg_rd_data_0;
wire [31:0] pkg_rd_size_0;
fdma_controller 
#(
	.ADDR_OFFSET(DDR_BASE0),
	.BUF_SIZE(3),
	.H_CNT (640),
	.V_CNT (480)
) 
u0_fdma_controller
(
	//FDAM signals
	.ui_clk(clk_100m),
	.ui_rstn(locked),
	//Sensor video 
	.W0_FS_i(W0_FS_i),
	.W0_wclk_i(W0_wclk_i),
	.W0_wren_i(W0_wren_i),
	.W0_data_i(W0_data_i), 
	//vga/hdmi output -CH6_FIFO 
	.R0_FS_i(R0_FS_i),
	.R0_rclk_i(R0_rclk_i),
	.R0_rden_i(R0_rden_i),
	.R0_data_o(R0_data_o),

	.pkg_wr_areq(pkg_wr_areq_0),    
	.pkg_wr_en(pkg_wr_en_0),
	.pkg_wr_last(pkg_wr_last_0),
	.pkg_wr_addr(pkg_wr_addr_0),
	.pkg_wr_data(pkg_wr_data_0),
	.pkg_wr_size(pkg_wr_size_0),

	.pkg_rd_areq(pkg_rd_areq_0),
	.pkg_rd_en(pkg_rd_en_0),      
	.pkg_rd_last(pkg_rd_last_0),
	.pkg_rd_addr(pkg_rd_addr_0),
	.pkg_rd_data(pkg_rd_data_0),
	.pkg_rd_size(pkg_rd_size_0)  
 );

//---------------fdma1 buf controller---------------------------  
parameter DDR_BASE1 = 32'h0200_0000;

wire  W1_FS_i = post_frame_vsync;
wire  W1_wclk_i = cmos_pclk;
wire  W1_wren_i = (frame_cnt == 2'd1) ? post_frame_href : 1'b0;
wire [31:0] W1_data_i = {8'd0, post_img_Gray};

wire  R1_FS_i = video_vs;
wire  R1_rclk_i = clk_hdmi;
wire  R1_rden_i = lcd_req;
wire  [31:0] R1_data_o; 

wire pkg_wr_areq_1;
wire pkg_wr_en_1;
wire pkg_wr_last_1;
wire [31:0] pkg_wr_addr_1;
wire [127:0] pkg_wr_data_1;
wire [31:0] pkg_wr_size_1;

wire pkg_rd_areq_1;
wire pkg_rd_en_1;
wire pkg_rd_last_1;
wire [31:0] pkg_rd_addr_1;
wire [127:0] pkg_rd_data_1;
wire [31:0] pkg_rd_size_1;
fdma_controller 
#(
	.ADDR_OFFSET(DDR_BASE1),
	.BUF_SIZE(3),
	.H_CNT (640),
	.V_CNT (480)
) 
u1_fdma_controller
(
	//FDAM signals
	.ui_clk(clk_100m),
	.ui_rstn(locked),
	//Sensor video 
	.W0_FS_i(W1_FS_i),
	.W0_wclk_i(W1_wclk_i),
	.W0_wren_i(W1_wren_i),
	.W0_data_i(W1_data_i), 
	//vga/hdmi output -CH6_FIFO 
	.R0_FS_i(R1_FS_i),
	.R0_rclk_i(R1_rclk_i),
	.R0_rden_i(R1_rden_i),
	.R0_data_o(R1_data_o),

	.pkg_wr_areq(pkg_wr_areq_1),    
	.pkg_wr_en(pkg_wr_en_1),
	.pkg_wr_last(pkg_wr_last_1),
	.pkg_wr_addr(pkg_wr_addr_1),
	.pkg_wr_data(pkg_wr_data_1),
	.pkg_wr_size(pkg_wr_size_1),

	.pkg_rd_areq(pkg_rd_areq_1),
	.pkg_rd_en(pkg_rd_en_1),      
	.pkg_rd_last(pkg_rd_last_1),
	.pkg_rd_addr(pkg_rd_addr_1),
	.pkg_rd_data(pkg_rd_data_1),
	.pkg_rd_size(pkg_rd_size_1)  
 );

//---------------fdma2 buf controller---------------------------  
parameter DDR_BASE2 = 32'h0300_0000;

wire  W2_FS_i = post_frame_vsync;
wire  W2_wclk_i = cmos_pclk;
wire  W2_wren_i = (frame_cnt == 2'd0) ? post_frame_href : 1'b0;
wire [31:0] W2_data_i = {8'd0, post_img_Gray};

wire  R2_FS_i = video_vs;
wire  R2_rclk_i = clk_hdmi;
wire  R2_rden_i = lcd_req;
wire  [31:0] R2_data_o; 

wire pkg_wr_areq_2;
wire pkg_wr_en_2;
wire pkg_wr_last_2;
wire [31:0] pkg_wr_addr_2;
wire [127:0] pkg_wr_data_2;
wire [31:0] pkg_wr_size_2;

wire pkg_rd_areq_2;
wire pkg_rd_en_2;
wire pkg_rd_last_2;
wire [31:0] pkg_rd_addr_2;
wire [127:0] pkg_rd_data_2;
wire [31:0] pkg_rd_size_2;
fdma_controller 
#(
	.ADDR_OFFSET(DDR_BASE2),
	.BUF_SIZE(3),
	.H_CNT (640),
	.V_CNT (480)
) 
u2_fdma_controller
(
	//FDAM signals
	.ui_clk(clk_100m),
	.ui_rstn(locked),
	//Sensor video 
	.W0_FS_i(W2_FS_i),
	.W0_wclk_i(W2_wclk_i),
	.W0_wren_i(W2_wren_i),
	.W0_data_i(W2_data_i), 
	//vga/hdmi output -CH6_FIFO 
	.R0_FS_i(R2_FS_i),
	.R0_rclk_i(R2_rclk_i),
	.R0_rden_i(R2_rden_i),
	.R0_data_o(R2_data_o),

	.pkg_wr_areq(pkg_wr_areq_2),    
	.pkg_wr_en(pkg_wr_en_2),
	.pkg_wr_last(pkg_wr_last_2),
	.pkg_wr_addr(pkg_wr_addr_2),
	.pkg_wr_data(pkg_wr_data_2),
	.pkg_wr_size(pkg_wr_size_2),

	.pkg_rd_areq(pkg_rd_areq_2),
	.pkg_rd_en(pkg_rd_en_2),      
	.pkg_rd_last(pkg_rd_last_2),
	.pkg_rd_addr(pkg_rd_addr_2),
	.pkg_rd_data(pkg_rd_data_2),
	.pkg_rd_size(pkg_rd_size_2)  
 );

//---------------fdma3 buf controller---------------------------  
parameter DDR_BASE3 = 32'h0400_0000;

wire  W3_FS_i = post_frame_vsync;
wire  W3_wclk_i = cmos_pclk;
wire  W3_wren_i = (frame_cnt == 2'd1) ? post_frame_href : 1'b0;
wire [31:0] W3_data_i = {8'd0, post_img_Gray};

wire  R3_FS_i = video_vs;
wire  R3_rclk_i = clk_hdmi;
wire  R3_rden_i = lcd_req;
wire  [31:0] R3_data_o; 

wire pkg_wr_areq_3;
wire pkg_wr_en_3;
wire pkg_wr_last_3;
wire [31:0] pkg_wr_addr_3;
wire [127:0] pkg_wr_data_3;
wire [31:0] pkg_wr_size_3;

wire pkg_rd_areq_3;
wire pkg_rd_en_3;
wire pkg_rd_last_3;
wire [31:0] pkg_rd_addr_3;
wire [127:0] pkg_rd_data_3;
wire [31:0] pkg_rd_size_3;
fdma_controller 
#(
	.ADDR_OFFSET(DDR_BASE3),
	.BUF_SIZE(3),
	.H_CNT (640),
	.V_CNT (480)
) 
u3_fdma_controller
(
	//FDAM signals
	.ui_clk(clk_100m),
	.ui_rstn(locked),
	//Sensor video 
	.W0_FS_i(W3_FS_i),
	.W0_wclk_i(W3_wclk_i),
	.W0_wren_i(W3_wren_i),
	.W0_data_i(W3_data_i), 
	//vga/hdmi output -CH6_FIFO 
	.R0_FS_i(R3_FS_i),
	.R0_rclk_i(R3_rclk_i),
	.R0_rden_i(R3_rden_i),
	.R0_data_o(R3_data_o),

	.pkg_wr_areq(pkg_wr_areq_3),    
	.pkg_wr_en(pkg_wr_en_3),
	.pkg_wr_last(pkg_wr_last_3),
	.pkg_wr_addr(pkg_wr_addr_3),
	.pkg_wr_data(pkg_wr_data_3),
	.pkg_wr_size(pkg_wr_size_3),

	.pkg_rd_areq(pkg_rd_areq_3),
	.pkg_rd_en(pkg_rd_en_3),      
	.pkg_rd_last(pkg_rd_last_3),
	.pkg_rd_addr(pkg_rd_addr_3),
	.pkg_rd_data(pkg_rd_data_3),
	.pkg_rd_size(pkg_rd_size_3)  
 );

wire	[7:0] Frame_Threshold;
system u_system
(		
	.DDR_addr(DDR_addr),
	.DDR_ba(DDR_ba),
	.DDR_cas_n(DDR_cas_n),
	.DDR_ck_n(DDR_ck_n),
	.DDR_ck_p(DDR_ck_p),
	.DDR_cke(DDR_cke),
	.DDR_cs_n(DDR_cs_n),
	.DDR_dm(DDR_dm),
	.DDR_dq(DDR_dq),
	.DDR_dqs_n(DDR_dqs_n),
	.DDR_dqs_p(DDR_dqs_p),
	.DDR_odt(DDR_odt),
	.DDR_ras_n(DDR_ras_n),
	.DDR_reset_n(DDR_reset_n),
	.DDR_we_n(DDR_we_n),
	.FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
	.FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
	.FIXED_IO_mio(FIXED_IO_mio),
	.FIXED_IO_ps_clk(FIXED_IO_ps_clk),
	.FIXED_IO_ps_porb(FIXED_IO_ps_porb),
	.FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),

	.ui_clk(clk_100m),
	.fdma_rstn(ui_rstn),

	.cap_pclk(cmos_pclk),
    .cap_threshole(Frame_Threshold),
    .cap_vsync(per_frame_vsync),

	//fdma0
	.pkg_wr_addr_0(pkg_wr_addr_0),
	.pkg_wr_data_0(pkg_wr_data_0),
	.pkg_wr_areq_0(pkg_wr_areq_0),
	.pkg_wr_en_0  (pkg_wr_en_0),
	.pkg_wr_last_0(pkg_wr_last_0),
	.pkg_wr_size_0(pkg_wr_size_0), 
	        
	.pkg_rd_addr_0(pkg_rd_addr_0),
	.pkg_rd_data_0(pkg_rd_data_0),
	.pkg_rd_areq_0(pkg_rd_areq_0),  
	.pkg_rd_en_0  (pkg_rd_en_0),   
	.pkg_rd_last_0(pkg_rd_last_0),
	.pkg_rd_size_0(pkg_rd_size_0),

	//fdma1
	.pkg_wr_addr_1(pkg_wr_addr_1),
	.pkg_wr_data_1(pkg_wr_data_1),
	.pkg_wr_areq_1(pkg_wr_areq_1),
	.pkg_wr_en_1  (pkg_wr_en_1),
	.pkg_wr_last_1(pkg_wr_last_1),
	.pkg_wr_size_1(pkg_wr_size_1), 
	        
	.pkg_rd_addr_1(pkg_rd_addr_1),
	.pkg_rd_data_1(pkg_rd_data_1),
	.pkg_rd_areq_1(pkg_rd_areq_1),  
	.pkg_rd_en_1  (pkg_rd_en_1),   
	.pkg_rd_last_1(pkg_rd_last_1),
	.pkg_rd_size_1(pkg_rd_size_1),	     

	//fdma2
	.pkg_wr_addr_2(pkg_wr_addr_2),
	.pkg_wr_data_2(pkg_wr_data_2),
	.pkg_wr_areq_2(pkg_wr_areq_2),
	.pkg_wr_en_2  (pkg_wr_en_2),
	.pkg_wr_last_2(pkg_wr_last_2),
	.pkg_wr_size_2(pkg_wr_size_2), 
	        
	.pkg_rd_addr_2(pkg_rd_addr_2),
	.pkg_rd_data_2(pkg_rd_data_2),
	.pkg_rd_areq_2(pkg_rd_areq_2),  
	.pkg_rd_en_2  (pkg_rd_en_2),   
	.pkg_rd_last_2(pkg_rd_last_2),
	.pkg_rd_size_2(pkg_rd_size_2),

	//fdma3
	.pkg_wr_addr_3(pkg_wr_addr_3),
	.pkg_wr_data_3(pkg_wr_data_3),
	.pkg_wr_areq_3(pkg_wr_areq_3),
	.pkg_wr_en_3  (pkg_wr_en_3),
	.pkg_wr_last_3(pkg_wr_last_3),
	.pkg_wr_size_3(pkg_wr_size_3), 
	        
	.pkg_rd_addr_3(pkg_rd_addr_3),
	.pkg_rd_data_3(pkg_rd_data_3),
	.pkg_rd_areq_3(pkg_rd_areq_3),  
	.pkg_rd_en_3  (pkg_rd_en_3),   
	.pkg_rd_last_3(pkg_rd_last_3),
	.pkg_rd_size_3(pkg_rd_size_3)
);

//--------------------------------------hdmi------------------
wire          video_hs;
wire          video_vs;
wire          video_de;
wire  [23:0]  video_rgb;

wire 	lcd_req_left, lcd_req_right, lcd_req;
wire	[11:0]	lcd_xpos;		//lcd horizontal coordinate
wire	[11:0]	lcd_ypos;		//lcd vertical coordinate
// reg		[23:0]	lcd_data_in;		//lcd data input

wire	[7:0] lcd_gray 	    = R0_data_o[7:0];
wire	[7:0] sys_data_out1 = R1_data_o[7:0];
wire	[7:0] sys_data_out2 = R2_data_o[7:0];
wire	[7:0] sys_data_out3 = R3_data_o[7:0];

wire	[7:0] lcd_Y1 = (sys_data_out2 >= sys_data_out1) ? sys_data_out2 - sys_data_out1 : sys_data_out1 - sys_data_out2;
wire	[7:0] lcd_Y2 = (sys_data_out3 >= sys_data_out2) ? sys_data_out3 - sys_data_out2 : sys_data_out2 - sys_data_out3;
wire	[7:0] lcd_Y  = lcd_Y1 & lcd_Y2;

wire	[7:0] lcd_T1 = (lcd_Y > Frame_Threshold) ? 8'h00 : 8'hff;
wire	[7:0] lcd_sw = framediff_flag ? lcd_T1 : sys_data_out1;

wire 	key3_flag, key3_state;
wire 	key_sw;
Key_Filter	u3_Key_Filter
(
	.Clk(clk_hdmi),      //50M时钟输入
	.Rst_n(locked),    //模块复位
	.key_in(~key3),   //按键输入
	.key_flag(key3_flag), //按键标志信号
	.key_state(key3_state) //按键状态信号
);
assign key_sw = key3_flag & !key3_state;

//Switch FrameDiffrence and Gray Image
reg	framediff_flag;
always@(posedge clk_hdmi or negedge locked)begin
	if(!locked)
		framediff_flag <= 1'b1;
	else if(key_sw)
		framediff_flag <= ~framediff_flag;
	else
		framediff_flag <= framediff_flag;
end

// always@(posedge clk_hdmi or negedge locked)begin
// 	if(!locked)
// 		lcd_data_in <= 0;
// 	else if(lcd_req_left == 1'b1)
// 		lcd_data_in <= {lcd_gray, lcd_gray, lcd_gray};
// 	else if(lcd_req_right == 1'b1)
// 		lcd_data_in <= {lcd_T1, lcd_T1, lcd_T1};
// 	else
// 		lcd_data_in <= 24'd0;	
// end

wire 	[3:0] Frame_Grade;
Key_Frame_Threshold	 u_Key_Frame_Threshold
(
	.clk(clk_hdmi),  		
	.rst_n(locked),		
	.key0(~key0),		
	.key1(~key1),		
	.Frame_Grade(Frame_Grade),	//Sobel Grade output
	.Frame_Threshold(Frame_Threshold)	//lcd pwn signal, l:valid
);

lcd_driver_dualwin u_lcd_driver_dualwin
(
	//global clock
	.clk			(clk_hdmi),		
	.rst_n			(locked), 
	 
	 //lcd interface	    	
	.lcd_hs			(video_hs),		
	.lcd_vs			(video_vs),
	.lcd_en			(video_de),		
	.lcd_rgb		(video_rgb),

	//user interface
	.lcd_request	(lcd_req),
	.lcd_request1	(lcd_req_left),
	.lcd_request2	(lcd_req_right),
	.lcd_data		({lcd_sw, lcd_sw, lcd_sw})	
	// .lcd_xpos		(lcd_xpos),	
	// .lcd_ypos		(lcd_ypos)
);

rgb2dvi_0 u_rgb2dvi_0 (
  .TMDS_Clk_p(tmds_clk_p),    // output wire TMDS_Clk_p
  .TMDS_Clk_n(tmds_clk_n),    // output wire TMDS_Clk_n
  .TMDS_Data_p(tmds_data_p),  // output wire [2 : 0] TMDS_Data_p
  .TMDS_Data_n(tmds_data_n),  // output wire [2 : 0] TMDS_Data_n
  .oen(),                  // output wire oen
  .aRst_n(locked),            // input wire aRst_n
  .vid_pData(video_rgb),      // input wire [23 : 0] vid_pData
  .vid_pVDE(video_de),        // input wire vid_pVDE
  .vid_pHSync(video_hs),    // input wire vid_pHSync
  .vid_pVSync(video_vs),    // input wire vid_pVSync
  .PixelClk(clk_hdmi),        // input wire PixelClk
  .SerialClk(clk_hdmi_5x)      // input wire SerialClk
);

endmodule
