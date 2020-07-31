`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/30 15:07:56
// Design Name: 
// Module Name: cmos_init
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


module cmos_init(
	Clk,
	Rst_n,
	
	Init_Done,
	cmos_rst_n,
	cmos_pwdn,
	
	i2c_sclk,
	i2c_sdat
);
	input Clk;
	input Rst_n;
	
	output reg Init_Done;
	output cmos_rst_n;
	output cmos_pwdn;
	
	output i2c_sclk;
	inout i2c_sdat;
	
	wire [15:0]addr;
	reg wrreg_req;
	reg rdreg_req;
	wire [7:0] wrdata;
	
	wire [7:0]rddata;
	wire RW_Done;
	wire ack;
    
  	reg [8:0]cnt;	
	wire [15:0]lut;

	localparam lut_size = 68;
	localparam device_id = 8'h42;
	localparam addr_mode = 1'b0;
	ov7725_init_table cmos_init_table(
		.addr(cnt),
		.clk(Clk),
		.q(lut)
	);
	assign addr = lut[15:8];
	assign wrdata = lut[7:0];

	i2c_control i2c_control(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.wrreg_req(wrreg_req),
		.rdreg_req(0),
		.addr(addr),
		.addr_mode(addr_mode),
		.wrdata(wrdata),
		.rddata(rddata),
		.device_id(device_id),
		.RW_Done(RW_Done),
		.ack(ack),		
		.i2c_sclk(i2c_sclk),
		.i2c_sdat(i2c_sdat)
	);
	
	wire Go;   //initial enable
	reg [19:0] delay_cnt;
	always @ (posedge Clk or negedge Rst_n)
	if (!Rst_n)
		delay_cnt <= 20'd0;
	else if (delay_cnt == 20'hfffff)
		delay_cnt <= delay_cnt;
	else
		delay_cnt <= delay_cnt + 10'd1;
	
	assign Go = (delay_cnt == 20'hffffe) ? 1'b1 : 1'b0;
	assign cmos_rst_n = (delay_cnt > 20'd10000);
	assign cmos_pwdn = 1'b0;
	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		cnt <= 0;
	else if(Go) 
		cnt <= 0;
	else if(cnt < lut_size)begin
		if(RW_Done && (!ack))
			cnt <= cnt + 1'b1;
		else
			cnt <= cnt;
	end
	else
		cnt <= 0;
		
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		Init_Done <= 0;
	else if(Go) 
		Init_Done <= 0;
	else if(cnt == lut_size)
		Init_Done <= 1;

	reg [1:0]state;
		
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)begin
		state <= 0;
		wrreg_req <= 1'b0;
	end
	else if(cnt < lut_size)begin
		case(state)
			0:
				if(Go)
					state <= 1;
				else
					state <= 0;
			1:
				begin
					wrreg_req <= 1'b1;
					state <= 2;
				end
			2:
				begin
					wrreg_req <= 1'b0;
					if(RW_Done)
						state <= 1;
					else
						state <= 2;
				end
			default:state <= 0;
		endcase
	end
	else
		state <= 0;

endmodule

