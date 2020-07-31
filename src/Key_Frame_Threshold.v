`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/05 19:34:03
// Design Name: 
// Module Name: Key_Sobel_Threshold
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


module Key_Frame_Threshold
(
	//global clock
	input				clk,  		//100MHz
	input				rst_n,		//global reset
	
	//user interface
	input				key0,		
	input				key1,		
	
	output		[3:0]	Frame_Grade,	//Frame Grade output
	output		[7:0]	Frame_Threshold	
);


wire key0_flag, key0_state;
wire key_add;
Key_Filter	u0_Key_Filter
(
	.Clk(clk),      //50M时钟输入
	.Rst_n(rst_n),    //模块复位
	.key_in(key0),   //按键输入
	.key_flag(key0_flag), //按键标志信号
	.key_state(key0_state) //按键状态信号
);
assign key_add = key0_flag & !key0_state;


wire key1_flag, key1_state;
wire key_sub;
Key_Filter	u1_Key_Filter
(
	.Clk(clk),      //50M时钟输入
	.Rst_n(rst_n),    //模块复位
	.key_in(key1),   //按键输入
	.key_flag(key1_flag), //按键标志信号
	.key_state(key1_state) //按键状态信号
);
assign key_sub = key1_flag & !key1_state;


Frame_Threshold_Adj	 u_Frame_Threshold_Adj
(
	.clk(clk),  		
	.rst_n(rst_n),		
	.key_add(key_add),		
	.key_sub(key_sub),		
	.Frame_Grade(Frame_Grade),	//Sobel Grade output
	.Frame_Threshold(Frame_Threshold)	//lcd pwn signal, l:valid
);


endmodule
