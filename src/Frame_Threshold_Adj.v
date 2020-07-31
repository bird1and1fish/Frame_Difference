`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/05 17:05:13
// Design Name: 
// Module Name: Frame_Threshold_Adj
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


module Frame_Threshold_Adj
(
	//global clock
	input				clk,  		//100MHz
	input				rst_n,		//global reset
	
	//user interface
	input				key_add,		
	input				key_sub,		
	
	output	reg	[3:0]	Frame_Grade,	//Sobel Grade output
	output	reg	[7:0]	Frame_Threshold	//lcd pwn signal, l:valid
);

//---------------------------------
//Sobel Threshold adjust with key.
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		Frame_Grade	<= 4'd2;
	else if(key_add)
		Frame_Grade <= (Frame_Grade == 4'd15)  ? 4'd0  : Frame_Grade + 1'b1;
	else if(key_sub)
		Frame_Grade <= (Frame_Grade == 4'd0) ? 4'd15 : Frame_Grade - 1'b1;
	else
		Frame_Grade <= Frame_Grade;
end


//---------------------------------
//Sobel Grade Mapping with Sobel Threshold
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		Frame_Threshold <= 15;
	else begin
		case(Frame_Grade)
			4'h0:	Frame_Threshold <= 5;
			4'h1:	Frame_Threshold <= 10;
			4'h2:	Frame_Threshold <= 15;
			4'h3:	Frame_Threshold <= 20;
			4'h5:	Frame_Threshold <= 25;
			4'h6:	Frame_Threshold <= 30;
			4'h7:	Frame_Threshold <= 35;
			4'h8:	Frame_Threshold <= 40;
			
			4'h9:	Frame_Threshold <= 45;
			4'ha:	Frame_Threshold <= 50;
			4'hb:	Frame_Threshold <= 55;
			4'hc:	Frame_Threshold <= 60;
			4'hd:	Frame_Threshold <= 65;
			4'he:	Frame_Threshold <= 70;
			4'hf:	Frame_Threshold <= 75;
			default:;
		endcase
	end	
end

endmodule

