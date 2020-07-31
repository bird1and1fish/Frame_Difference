`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 07:16:06
// Design Name: 
// Module Name: boundary_tracking
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


module boundary_tracking
(
	input 				clk, //lcd clock
	input 				rst_n,

	input	[7:0]		th_value,
	input				lcd_vs,
	input  [11:0]      	hcount_r0,
	input  [11:0]      	vcount_r0,
	output reg [11:0] 	hcount_l,
	output reg [11:0] 	hcount_r,
	output reg [11:0] 	vcount_l,
	output reg [11:0] 	vcount_r
);
		 
parameter   F1 = 4'b0001,//1
            F2 = 4'b0010,//2
			F3 = 4'b0100,//4
			F4 = 4'b1000;//8

//--------------------------------------
reg [11:0]     hcount, hcount_r1;
always @(posedge clk)begin
	// hcount_r1 <= hcount_r0;
	hcount <= hcount_r0;
end

reg [11:0]     vcount, vcount_r1;
always @(posedge clk)begin
	// vcount_r1 <= vcount_r0;
	vcount <= vcount_r0;
end

reg [1:0] 	lcd_vs_r;
always @(posedge clk)begin
	lcd_vs_r <= {lcd_vs_r[0], lcd_vs};
end

wire  	lcd_vs_rise  = (lcd_vs_r == 2'b01) ? 1'b1 :1'b0;
wire 	lcd_vs_fall  = (lcd_vs_r == 2'b10) ? 1'b1 :1'b0;

//-------------------------------------------------------------
reg [7:0] th_value_r;
always @(posedge clk)begin
	th_value_r <= th_value;
end
// threshold value
reg th_flag;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) 
	 	th_flag <= 1'b0;
	else if(th_value_r == 8'h00) 
	 	th_flag <= 1'b1;
	else
	 	th_flag <= 1'b0;
end 

reg [1:0] 	th_flag_r;
always @(posedge clk)begin
	th_flag_r <= {th_flag_r[0], th_flag};
end

wire	th_flag_rise = (th_flag_r == 2'b01); 
wire 	th_flag_fall = (th_flag_r == 2'b10);

//-------------------------------------------------------------
//frame counter
reg [2:0]   frame_cnt;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) 
		frame_cnt <=3'd0;
	else if(frame_cnt == 3'd4)
		frame_cnt <=3'd0;
	else if(lcd_vs_fall== 1'b1) //falling edge
		frame_cnt <= frame_cnt + 3'd1;
	else
		frame_cnt <= frame_cnt;   
end 

//--------------------------------------------------
// FSM 1
reg  [3:0]  cstate;
reg  [3:0]  nstate;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cstate <= F1;
	else
		cstate <= nstate;
end

//-------------------------------------------------
// FSM2
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		nstate <= F1;
	else begin
		case(cstate)
			F1:	if(frame_cnt==3'd1)
			 		nstate <= F2;
			 	else
					nstate <= F1;
			F2:	if(frame_cnt==3'd2)
			 		nstate <= F3;
			 	else
					nstate <= F2;
			F3:	if(frame_cnt==3'd3)
			 		nstate <= F4;
			 	else
					nstate <= F3;
			F4:	if(frame_cnt==3'd0)
			 		nstate <= F1;
			 	else
					nstate <= F4;
	  	endcase	
	 end		
end
 
//--------------------------------------------------
// FSM3
reg 	x_wr_en, y_wr_en;
reg 	x_rd_en, y_rd_en;
reg [15:0]  th_cnt;
always @(posedge clk or negedge rst_n)begin 
	if(!rst_n)begin
		x_wr_en <= 1'b0;
		x_rd_en <= 1'b0;
		y_wr_en <= 1'b0;
		y_rd_en <= 1'b0;
  	end
  	else begin
   		case(cstate) 
			F1: //if((hcount > 1))begin
					if(th_flag) begin
						x_wr_en <= 1'b1;
						y_wr_en <= 1'b1;
					end
					else begin
						x_wr_en <= 1'b0;
						y_wr_en <= 1'b0;
					end 
				// end
			F2: if(th_cnt >= 16'd0)begin
					x_rd_en <= 1'b1;
					y_rd_en <= 1'b1;
				end
				else begin
					x_rd_en <= 1'b0;
					y_rd_en <= 1'b0;
				end
			default:begin
						x_wr_en <= 1'b0;
						x_rd_en <= 1'b0;
						y_wr_en <= 1'b0;
						y_rd_en <= 1'b0;
					end
		endcase
	end
end

//-------------------------------

always @(posedge clk or negedge rst_n)begin 
	if(!rst_n)
		th_cnt <= 16'd0;
	else if((cstate == F1) && lcd_vs_rise)
		th_cnt <= 16'd0;
	else if((cstate == F1) && (hcount > 0))begin
		// if(th_flag_rise || th_flag_fall)
		if(th_flag)
	  		th_cnt <= th_cnt + 16'd1;
	 	else
	   		th_cnt <= th_cnt;
	end		
	else if(cstate == F2)begin
		if(th_cnt == 16'd0)
	   		th_cnt <= th_cnt;
	 	else
	  		th_cnt <= th_cnt - 16'd1;
	end	
	else
		th_cnt <= th_cnt;
end

//-----------------------------------------
//x
wire [11:0]		x_data;
reg [11:0]  	x_data_r0;
reg [11:0] 	 	x_data_r1;
reg [11:0]  	x_data_r2;
always @(posedge clk)begin
	x_data_r0 <= x_data;
	x_data_r1 <= x_data_r0;
	x_data_r2 <= x_data_r1;
end

reg         x_rd_en_r0;
reg         x_rd_en_r1;
always @(posedge clk)begin
	x_rd_en_r0 <= x_rd_en;
	x_rd_en_r1 <= x_rd_en_r0;
end

wire  	x_rd_en_rise = (x_rd_en_r0 && (!x_rd_en_r1)) ? 1'b1:1'b0;
wire  	x_rd_en_fall = (!x_rd_en_r0 && x_rd_en_r1) ? 1'b1:1'b0;
wire 	sclr = ((cstate == F3) && lcd_vs_rise) ?1'b1:1'b0;

//-----------------------
//x min
reg [11:0]  x_data_min;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		x_data_min <= 12'd0;
	else if((cstate == F2) && x_rd_en_rise)begin
		if(x_data_r0 < x_data) 
			x_data_min <= x_data;
		else
			x_data_min <= x_data_r0;
	end
	else if((cstate == F2) && x_rd_en_r1)begin
		if(x_data < x_data_min) 
			x_data_min <= x_data;
	 	else 
			x_data_min <= x_data_min;
	end
	else 
	 	x_data_min <= x_data_min;
end

//-------------------------------------
//x max
reg [11:0]  x_data_max;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		x_data_max <= 12'd0;
	else if((cstate == F2) && x_rd_en_rise)begin
		if(x_data_r0 > x_data)  
	   		x_data_max <= x_data_r0;
	 	else 
	   		x_data_max <= x_data;
	end
	else if((cstate == F2) && x_rd_en_r1)begin
		if(x_data_max < x_data) 
	   		x_data_max <= x_data;
	 	else 
	   		x_data_max <= x_data_max;
	end
	else 
		x_data_max <= x_data_max;
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		hcount_l <= 12'd0;
	 	hcount_r <= 12'd0;
	end
	else if((cstate == F3) && lcd_vs_rise)begin
		hcount_l <= x_data_min - 1;
	 	hcount_r <= x_data_max + 1;
	end 
end

//----------------------------------------------------//
//y
wire [11:0] y_data;
reg [11:0]  y_data_r0;
reg [11:0]  y_data_r1;
reg [11:0]  y_data_r2;

always @(posedge clk)begin
	y_data_r0 <= y_data;
	y_data_r1 <= y_data_r0;
	y_data_r2 <= y_data_r1;
end

reg         y_rd_en_r0;
reg         y_rd_en_r1;
always @(posedge clk)begin
	y_rd_en_r0 <= y_rd_en;
	y_rd_en_r1 <= y_rd_en_r0;
end

wire  y_rd_en_rise = (y_rd_en_r0 && (!y_rd_en_r1)) ? 1'b1:1'b0;
wire  y_rd_en_fall = (!y_rd_en_r0 && y_rd_en_r1) ? 1'b1:1'b0;

reg [11:0]  y_data_min;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		y_data_min <= 12'd0;
	else if((cstate == F2) && y_rd_en_rise)begin
		if(y_data_r0 < y_data) 
			y_data_min <= y_data;
	 	else
			y_data_min <= y_data_r0;
	end
	else if((cstate == F2) && y_rd_en_r1)begin
		if(y_data < y_data_min) 
			y_data_min <= y_data;
	 	else 
			y_data_min <= y_data_min;
	end
	else 
	 	y_data_min <= y_data_min;
end

reg [11:0]  y_data_max;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) 
		y_data_max <= 12'd0;
	else if((cstate == F2) && y_rd_en_rise)begin
		if(y_data_r0 > y_data)  
	   		y_data_max <= y_data_r0;
	 	else 
	  		y_data_max <= y_data;
	end
	else if((cstate == F2) && y_rd_en_r1 )begin
		if(y_data_max < y_data) 
	   		y_data_max <= y_data;
	 	else 
	   		y_data_max <= y_data_max;
	end
	else 
		y_data_max <= y_data_max;
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		vcount_l <= 12'd0;
	 	vcount_r <= 12'd0;
	end
	else if((cstate == F3) && lcd_vs_rise) begin
		vcount_l <= y_data_min - 1;
	 	vcount_r <= y_data_max + 1;
  end 
end

reg [11:0] hcount_r2, hcount_r3;
always @(posedge clk)begin
	hcount_r2 <= hcount;
	hcount_r3 <= hcount_r2;
end					
wire full_x, empty_x;
fifo_xy fifo_x
(
	.clk(clk),      // input wire clk
	.srst(sclr),    // input wire srst
	.din(hcount_r3),      // input wire [11 : 0] din
	.wr_en(x_wr_en),  // input wire wr_en
	.rd_en(x_rd_en),  // input wire rd_en
	.dout(x_data),    // output wire [11 : 0] dout
	.full(full_x),    // output wire full
	.empty(empty_x)  // output wire empty
);

reg [11:0] vcount_r2, vcount_r3;
always @(posedge clk)begin
	vcount_r2 <= vcount;
	vcount_r3 <= vcount_r2;
end

wire full_y, empty_y;
fifo_xy fifo_y
(
	.clk(clk),      // input wire clk
	.srst(1'b0),    // input wire srst
	.din(vcount_r3),      // input wire [11 : 0] din
	.wr_en(y_wr_en),  // input wire wr_en
	.rd_en(y_rd_en),  // input wire rd_en
	.dout(y_data),    // output wire [11 : 0] dout
	.full(full_y),    // output wire full
	.empty(empty_y)  // output wire empty
);
	
endmodule 
