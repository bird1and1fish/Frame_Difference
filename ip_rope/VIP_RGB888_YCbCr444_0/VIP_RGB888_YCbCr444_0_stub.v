// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Jul  7 14:03:12 2020
// Host        : CrazyWei running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Desktop/fdma_demo/VIP_Gray_Med/VIP_Gray_Med.srcs/sources_1/ip/VIP_RGB888_YCbCr444_0/VIP_RGB888_YCbCr444_0_stub.v
// Design      : VIP_RGB888_YCbCr444_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "VIP_RGB888_YCbCr444,Vivado 2018.3" *)
module VIP_RGB888_YCbCr444_0(clk, rst_n, per_frame_vsync, per_frame_href, 
  per_frame_clken, per_img_rgb888, post_frame_vsync, post_frame_href, post_frame_clken, 
  post_img_gray)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,per_frame_vsync,per_frame_href,per_frame_clken,per_img_rgb888[23:0],post_frame_vsync,post_frame_href,post_frame_clken,post_img_gray[23:0]" */;
  input clk;
  input rst_n;
  input per_frame_vsync;
  input per_frame_href;
  input per_frame_clken;
  input [23:0]per_img_rgb888;
  output post_frame_vsync;
  output post_frame_href;
  output post_frame_clken;
  output [23:0]post_img_gray;
endmodule
