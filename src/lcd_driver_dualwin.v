`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/10 17:57:21
// Design Name: 
// Module Name: lcd_driver_dualwin
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


module lcd_driver_dualwin
(  	
	//global clock
	input			clk,			//system clock
	input			rst_n,     		//sync reset
	
	//lcd interface
	output			lcd_hs,	    	//lcd horizontal sync
	output			lcd_vs,	    	//lcd vertical sync
	output			lcd_en,			//lcd display enable
	output	[23:0]	lcd_rgb,		//lcd display data

	//user interface
	output			lcd_request,
	output			lcd_request1,	//lcd data request
	output			lcd_request2,	//lcd data request
	// output	[11:0]	lcd_xpos,		//lcd horizontal coordinate
	// output	[11:0]	lcd_ypos,		//lcd vertical coordinate
	input	[23:0]	lcd_data		//lcd data
);	 

`include "lcd_para.vh" 

/*******************************************
		SYNC--BACK--DISP--FRONT
*******************************************/
//------------------------------------------
//h_sync counter & generator
reg [11:0] hcnt; 
always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		hcnt <= 12'd0;
	else
		begin
        if(hcnt < `H_TOTAL - 1'b1)		//line over			
            hcnt <= hcnt + 1'b1;
        else
            hcnt <= 12'd0;
		end
end 
assign	lcd_hs = (hcnt <= `H_SYNC - 1'b1) ? 1'b0 : 1'b1;

//------------------------------------------
//v_sync counter & generator
reg [11:0] vcnt;
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		vcnt <= 12'b0;
	else if(hcnt == `H_TOTAL - 1'b1)		//line over
		begin
		if(vcnt < `V_TOTAL - 1'b1)		//frame over
			vcnt <= vcnt + 1'b1;
		else
			vcnt <= 12'd0;
		end
end
assign	lcd_vs = (vcnt <= `V_SYNC - 1'b1) ? 1'b0 : 1'b1;

//-----------------------------------------
assign	lcd_en		=	(hcnt >= `H_SYNC + `H_BACK  && hcnt < `H_SYNC + `H_BACK + `H_DISP) &&
						(vcnt >= `V_SYNC + `V_BACK  && vcnt < `V_SYNC + `V_BACK + `V_DISP) 
						? 1'b1 : 1'b0;
// assign	lcd_rgb 	= 	lcd_en ? lcd_data : 24'h000000;	//ffffff;


//------------------------------------------
//ahead x clock
localparam	H_AHEAD = 	12'd5;

assign	lcd_request =	(hcnt >= `H_SYNC + `H_BACK - H_AHEAD && hcnt < `H_SYNC + `H_BACK + `H_DISP- H_AHEAD) &&
						(vcnt >= `V_SYNC + `V_BACK  && vcnt < `V_SYNC + `V_BACK + `V_DISP) 
						? 1'b1 : 1'b0;
						
assign	lcd_request1=	(hcnt >= `H_SYNC + `H_BACK + 0 - H_AHEAD && hcnt < `H_SYNC + `H_BACK + 640 - H_AHEAD) &&
						(vcnt >= `V_SYNC + `V_BACK + 120 && vcnt < `V_SYNC + `V_BACK + 600) 
						? 1'b1 : 1'b0;
						
assign	lcd_request2=	(hcnt >= `H_SYNC + `H_BACK + 640 - H_AHEAD && hcnt < `H_SYNC + `H_BACK + 1280 - H_AHEAD) &&
						(vcnt >= `V_SYNC + `V_BACK + 120 && vcnt < `V_SYNC + `V_BACK + 600) 
						? 1'b1 : 1'b0;
						
//lcd xpos & ypos
wire	[11:0]	lcd_xpos;		//lcd horizontal coordinate
wire	[11:0]	lcd_ypos;
assign	lcd_xpos	= 	lcd_request ? (hcnt - (`H_SYNC + `H_BACK - H_AHEAD)) : 12'd0;
assign	lcd_ypos	= 	lcd_request ? (vcnt - (`V_SYNC + `V_BACK)) : 12'd0;

wire [11:0] hcount_l;
wire [11:0] hcount_r;
wire [11:0] vcount_l;
wire [11:0] vcount_r;
boundary_tracking u_boundary_tracking
(
	.clk 		(clk), //lcd clock
	.rst_n 		(rst_n),

	.th_value	(lcd_data[7:0]),
	.lcd_vs 	(lcd_vs),
	.hcount_r0 	(lcd_xpos),
	.vcount_r0 	(lcd_ypos),
	.hcount_l 	(hcount_l),
	.hcount_r 	(hcount_r),
	.vcount_l 	(vcount_l),
	.vcount_r 	(vcount_r)
);

reg [23:0]	lcd_rgb;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) 
		lcd_rgb <= 24'h000000;
	else if(lcd_en)begin
		if(lcd_ypos > vcount_l && lcd_ypos < vcount_r && ( lcd_xpos == hcount_l || lcd_xpos == hcount_r || lcd_xpos == (hcount_l - 1) || lcd_xpos == (hcount_r + 1)))
		// if(lcd_ypos > 100 && lcd_ypos < vcount_r && ( lcd_xpos == 100 || lcd_xpos == vcount_r || lcd_xpos == (100 - 1) || lcd_xpos == (vcount_r + 1)))	
			lcd_rgb <= 24'hff0000;
		else if (lcd_xpos > hcount_l && lcd_xpos < hcount_r && (lcd_ypos == vcount_l || lcd_ypos == vcount_r || lcd_ypos == ( vcount_l - 1) || lcd_ypos == (vcount_r + 1)))
		// else if (lcd_xpos > 100 && lcd_xpos < hcount_r && (lcd_ypos == 100 || lcd_ypos == hcount_r || lcd_ypos == ( 100 - 1) || lcd_ypos == (hcount_r + 1)))
			lcd_rgb <= 24'hff0000;
		else
			lcd_rgb <= lcd_data;
		// else if(lcd_data[7:0] > 64)
		// 	lcd_rgb <= 24'hffffff;
		// else
		// 	lcd_rgb <= 24'h000000;
	end
	else 
		lcd_rgb <= 24'h000000;
end

endmodule

