`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/09 15:48:43
// Design Name: 
// Module Name: ov7725_init_table
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


module ov7725_init_table
#(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] addr,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q
);

	always@(posedge clk)begin
    	case(addr)
			0 : q = 16'h12_80;	// BIT[7]-Reset all the Reg 
			1 : q = 16'h3d_03;	//DC offset for analog process
			2 : q = 16'h15_02;	//COM10: href/vsync/pclk/data reverse(Vsync H valid)
			3 : q = 16'h17_23;	//VGA:	16'h22;	QVGA:	16'h3f;
			4 : q = 16'h18_a0;	//VGA:	16'ha4;	QVGA:	16'h50;
			5 : q = 16'h19_07;	//VGA:	16'h07;	QVGA:	16'h03;
			6 : q = 16'h1a_f0;	//VGA:	16'hf0;	QVGA:	16'h78;
			7 : q = 16'h32_00;	//HREF	/ 16'h80
			8 : q = 16'h29_A0;	//VGA:	16'hA0;	QVGA:	16'hF0
			9 : q = 16'h2C_F0;	//VGA:	16'hF0;	QVGA:	16'h78
			10: q = 16'h0d_41;	//Bypass PLL
			11: q = 16'h11_00;	//CLKRC,Finternal clock = Finput clk*PLL multiplier/[(CLKRC[5:0]+1)*2] = 25MHz*4/[(x+1)*2]
			
			12: q = 16'h12_03;	//BIT[6]:	0:VGA; 1;QVGA
			        			//BIT[3:2]:	01:RGB565
			        			//VGA:	00:YUV; 01:Processed Bayer RGB; 10:RGB;	11:Bayer RAW; BIT[7]-Reset all the Reg  
			13: q = 16'h0C_90;	//COM3: Bit[7:6]:Vertical/Horizontal mirror image ON/OFF, Bit[0]:Color bar; Default:16'h10
			//DSP control
			14: q = 16'h42_7f;	//BLC Blue Channel Target Value, Default: 16'h80
			15: q = 16'h4d_09;	//BLC Red Channel Target Value, Default: 16'h80
			16: q = 16'h63_f0;	//AWB Control
			17: q = 16'h64_ff;	//DSP_Ctrl1:
			18: q = 16'h65_00;	//DSP_Ctrl2:	
			19: q = 16'h66_00;	//{COM3[4](0x0C), DSP_Ctrl3[7]}:00:YUYV;	01:YVYU;	[10:UYVY]	11:VYUY
			20: q = 16'h67_03;	//DSP_Ctrl4:00/01: YUV or RGB; 10: RAW8; 11: RAW10	
			//AGC AEC AWB
			21: q = 16'h13_ff;
			22: q = 16'h0f_c5;
			23: q = 16'h14_11;
			24: q = 16'h22_98;	//Banding Filt er Minimum AEC Value; Default: 16'h09
			25: q = 16'h23_03;	//Banding Filter Maximum Step
			26: q = 16'h24_40;	//AGC/AEC - Stable Operating Region (Upper Limit)
			27: q = 16'h25_30;	//AGC/AEC - Stable Operating Region (Lower Limit)
			28: q = 16'h26_a1;	//AGC/AEC Fast Mode Operating Region
			29: q = 16'h2b_9e;	//TaiWan: 16'h00:60Hz Filter; Mainland: 16'h9e:50Hz Filter
			30: q = 16'h6b_aa;	//AWB Control 3
			31: q = 16'h13_ff;	//16'hff: AGC AEC AWB Enable; 16'hf0: AGC AEC AWB Disable;
			//matrix sharpness brightness contrast UV
			32: q = 16'h90_0a;	
			33: q = 16'h91_01;
			34: q = 16'h92_01;
			35: q = 16'h93_01;
			36: q = 16'h94_5f;
			37: q = 16'h95_53;
			38: q = 16'h96_11;
			39: q = 16'h97_1a;
			40: q = 16'h98_3d;
			41: q = 16'h99_5a;
			42: q = 16'h9a_1e;
			43: q = 16'h9b_3f;	//Brightness 
			44: q = 16'h9c_25;
			45: q = 16'h9e_81;	
			46: q = 16'ha6_06;
			47: q = 16'ha7_65;
			48: q = 16'ha8_65;
			49: q = 16'ha9_80;
			50: q = 16'haa_80;
			//Gamma correction
			51: q = 16'h7e_0c;
			52: q = 16'h7f_16;	
			53: q = 16'h80_2a;
			54: q = 16'h81_4e;
			55: q = 16'h82_61;
			56: q = 16'h83_6f;
			57: q = 16'h84_7b;
			58: q = 16'h85_86;
			59: q = 16'h86_8e;
			60: q = 16'h87_97;
			61: q = 16'h88_a4;
			62: q = 16'h89_af;
			63: q = 16'h8a_c5;
			64: q = 16'h8b_d7;
			65: q = 16'h8c_e8;
			66 : q =16'h8d_20;
			67 : q = 16'h0e_65;//night mode auto frame rate control
    		default:	q	=	0;
    	endcase 
    end
	
endmodule

