`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/05 17:07:45
// Design Name: 
// Module Name: Key_Filter
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


module Key_Filter
(
	Clk,      //50M时钟输入
	Rst_n,    //模块复位
	key_in,   //按键输入
	key_flag, //按键标志信号
	key_state //按键状态信号
);

	input Clk;
	input Rst_n;
	input key_in;
	
	output reg key_flag;
	output reg key_state;
	
	localparam
		IDEL		= 4'b0001,
		FILTER0	= 4'b0010,
		DOWN		= 4'b0100,
		FILTER1 	= 4'b1000;
		
	reg [3:0]state;
	reg [19:0]cnt;
	reg en_cnt;	//使能计数寄存器
	
//对外部输入的异步信号进行同步处理
	reg key_in_sa,key_in_sb;
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)begin
		key_in_sa <= 1'b0;
		key_in_sb <= 1'b0;
	end
	else begin
		key_in_sa <= key_in;
		key_in_sb <= key_in_sa;	
	end
	
	reg key_tmpa,key_tmpb;
	wire pedge,nedge;
	reg cnt_full;//计数满标志信号
	
//使用D触发器存储两个相邻时钟上升沿时外部输入信号（已经同步到系统时钟域中）的电平状态
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)begin
		key_tmpa <= 1'b0;
		key_tmpb <= 1'b0;
	end
	else begin
		key_tmpa <= key_in_sb;
		key_tmpb <= key_tmpa;	
	end

//产生跳变沿信号	
	assign nedge = !key_tmpa & key_tmpb;
	assign pedge = key_tmpa & (!key_tmpb);
	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)begin
		en_cnt <= 1'b0;
		state <= IDEL;
		key_flag <= 1'b0;
		key_state <= 1'b1;
	end
	else begin
		case(state)
			IDEL :
				begin
					key_flag <= 1'b0;
					if(nedge)begin
						state <= FILTER0;
						en_cnt <= 1'b1;
					end
					else
						state <= IDEL;
				end
					
			FILTER0:
				if(cnt_full)begin
					key_flag <= 1'b1;
					key_state <= 1'b0;
					en_cnt <= 1'b0;
					state <= DOWN;
				end
				else if(pedge)begin
					state <= IDEL;
					en_cnt <= 1'b0;
				end
				else
					state <= FILTER0;
					
			DOWN:
				begin
					key_flag <= 1'b0;
					if(pedge)begin
						state <= FILTER1;
						en_cnt <= 1'b1;
					end
					else
						state <= DOWN;
				end
			
			FILTER1:
				if(cnt_full)begin
					key_flag <= 1'b1;
					key_state <= 1'b1;
					state <= IDEL;
					en_cnt <= 1'b0;
				end
				else if(nedge)begin
					en_cnt <= 1'b0;
					state <= DOWN;
				end
				else
					state <= FILTER1;
			
			default:
				begin 
					state <= IDEL; 
					en_cnt <= 1'b0;		
					key_flag <= 1'b0;
					key_state <= 1'b1;
				end
				
		endcase	
	end
	

	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		cnt <= 20'd0;
	else if(en_cnt)
		cnt <= cnt + 1'b1;
	else
		cnt <= 20'd0;
	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		cnt_full <= 1'b0;
	else if(cnt == 20'd240000)
		cnt_full <= 1'b1;
	else
		cnt_full <= 1'b0;	

endmodule
