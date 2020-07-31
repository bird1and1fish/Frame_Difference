// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Jul  7 14:03:12 2020
// Host        : CrazyWei running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               h:/Desktop/fdma_demo/VIP_Gray_Med/VIP_Gray_Med.srcs/sources_1/ip/VIP_RGB888_YCbCr444_0/VIP_RGB888_YCbCr444_0_sim_netlist.v
// Design      : VIP_RGB888_YCbCr444_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "VIP_RGB888_YCbCr444_0,VIP_RGB888_YCbCr444,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "VIP_RGB888_YCbCr444,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module VIP_RGB888_YCbCr444_0
   (clk,
    rst_n,
    per_frame_vsync,
    per_frame_href,
    per_frame_clken,
    per_img_rgb888,
    post_frame_vsync,
    post_frame_href,
    post_frame_clken,
    post_img_gray);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame VSYNC" *) input per_frame_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame ACTIVE_VIDEO" *) input per_frame_href;
  input per_frame_clken;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame DATA" *) input [23:0]per_img_rgb888;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame VSYNC" *) output post_frame_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame ACTIVE_VIDEO" *) output post_frame_href;
  output post_frame_clken;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame DATA" *) output [23:0]post_img_gray;

  wire clk;
  wire \img_Y_r0_reg[15]_i_9_n_0 ;
  wire inst_n_1;
  wire per_frame_clken;
  wire per_frame_href;
  wire per_frame_vsync;
  wire [23:0]per_img_rgb888;
  wire post_frame_clken;
  wire post_frame_href;
  wire post_frame_vsync;
  wire [23:16]\^post_img_gray ;
  wire rst_n;

  assign post_img_gray[23:16] = \^post_img_gray [23:16];
  assign post_img_gray[15:8] = \^post_img_gray [23:16];
  assign post_img_gray[7:0] = \^post_img_gray [23:16];
  FDCE \img_Y_r0_reg[15]_i_9 
       (.C(clk),
        .CE(1'b1),
        .CLR(inst_n_1),
        .D(1'b1),
        .Q(\img_Y_r0_reg[15]_i_9_n_0 ));
  VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444 inst
       (.Q(post_frame_href),
        .clk(clk),
        .\img_Y_r0_reg[15]_0 (\img_Y_r0_reg[15]_i_9_n_0 ),
        .per_frame_clken(per_frame_clken),
        .per_frame_href(per_frame_href),
        .per_frame_vsync(per_frame_vsync),
        .per_img_rgb888(per_img_rgb888),
        .post_frame_clken(post_frame_clken),
        .post_frame_vsync(post_frame_vsync),
        .post_img_gray(\^post_img_gray ),
        .rst_n(rst_n),
        .rst_n_0(inst_n_1));
endmodule

(* ORIG_REF_NAME = "VIP_RGB888_YCbCr444" *) 
module VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444
   (post_frame_vsync,
    rst_n_0,
    Q,
    post_frame_clken,
    post_img_gray,
    \img_Y_r0_reg[15]_0 ,
    clk,
    per_frame_vsync,
    per_frame_href,
    per_frame_clken,
    per_img_rgb888,
    rst_n);
  output post_frame_vsync;
  output rst_n_0;
  output [0:0]Q;
  output post_frame_clken;
  output [7:0]post_img_gray;
  input \img_Y_r0_reg[15]_0 ;
  input clk;
  input per_frame_vsync;
  input per_frame_href;
  input per_frame_clken;
  input [23:0]per_img_rgb888;
  input rst_n;

  wire [0:0]Q;
  wire clk;
  wire \img_Y_r0[11]_i_10_n_0 ;
  wire \img_Y_r0[11]_i_12_n_0 ;
  wire \img_Y_r0[11]_i_13_n_0 ;
  wire \img_Y_r0[11]_i_14_n_0 ;
  wire \img_Y_r0[11]_i_15_n_0 ;
  wire \img_Y_r0[11]_i_16_n_0 ;
  wire \img_Y_r0[11]_i_17_n_0 ;
  wire \img_Y_r0[11]_i_18_n_0 ;
  wire \img_Y_r0[11]_i_19_n_0 ;
  wire \img_Y_r0[11]_i_20_n_0 ;
  wire \img_Y_r0[11]_i_21_n_0 ;
  wire \img_Y_r0[11]_i_22_n_0 ;
  wire \img_Y_r0[11]_i_23_n_0 ;
  wire \img_Y_r0[11]_i_24_n_0 ;
  wire \img_Y_r0[11]_i_25_n_0 ;
  wire \img_Y_r0[11]_i_26_n_0 ;
  wire \img_Y_r0[11]_i_3_n_0 ;
  wire \img_Y_r0[11]_i_4_n_0 ;
  wire \img_Y_r0[11]_i_5_n_0 ;
  wire \img_Y_r0[11]_i_6_n_0 ;
  wire \img_Y_r0[11]_i_7_n_0 ;
  wire \img_Y_r0[11]_i_8_n_0 ;
  wire \img_Y_r0[11]_i_9_n_0 ;
  wire \img_Y_r0[15]_i_2_n_0 ;
  wire \img_Y_r0[15]_i_3_n_0 ;
  wire \img_Y_r0[15]_i_4_n_0 ;
  wire \img_Y_r0[15]_i_5_n_0 ;
  wire \img_Y_r0[15]_i_6_n_0 ;
  wire \img_Y_r0[15]_i_7_n_0 ;
  wire \img_Y_r0[15]_i_8_n_0 ;
  wire \img_Y_r0_reg[11]_i_11_n_0 ;
  wire \img_Y_r0_reg[11]_i_11_n_1 ;
  wire \img_Y_r0_reg[11]_i_11_n_2 ;
  wire \img_Y_r0_reg[11]_i_11_n_3 ;
  wire \img_Y_r0_reg[11]_i_1_n_0 ;
  wire \img_Y_r0_reg[11]_i_1_n_1 ;
  wire \img_Y_r0_reg[11]_i_1_n_2 ;
  wire \img_Y_r0_reg[11]_i_1_n_3 ;
  wire \img_Y_r0_reg[11]_i_1_n_4 ;
  wire \img_Y_r0_reg[11]_i_1_n_5 ;
  wire \img_Y_r0_reg[11]_i_1_n_6 ;
  wire \img_Y_r0_reg[11]_i_1_n_7 ;
  wire \img_Y_r0_reg[11]_i_2_n_0 ;
  wire \img_Y_r0_reg[11]_i_2_n_1 ;
  wire \img_Y_r0_reg[11]_i_2_n_2 ;
  wire \img_Y_r0_reg[11]_i_2_n_3 ;
  wire \img_Y_r0_reg[15]_0 ;
  wire \img_Y_r0_reg[15]_i_1_n_1 ;
  wire \img_Y_r0_reg[15]_i_1_n_2 ;
  wire \img_Y_r0_reg[15]_i_1_n_3 ;
  wire \img_Y_r0_reg[15]_i_1_n_4 ;
  wire \img_Y_r0_reg[15]_i_1_n_5 ;
  wire \img_Y_r0_reg[15]_i_1_n_6 ;
  wire \img_Y_r0_reg[15]_i_1_n_7 ;
  wire [7:0]img_Y_r1;
  wire img_blue_r00_n_100;
  wire img_blue_r00_n_101;
  wire img_blue_r00_n_102;
  wire img_blue_r00_n_103;
  wire img_blue_r00_n_104;
  wire img_blue_r00_n_105;
  wire img_blue_r00_n_93;
  wire img_blue_r00_n_94;
  wire img_blue_r00_n_95;
  wire img_blue_r00_n_96;
  wire img_blue_r00_n_97;
  wire img_blue_r00_n_98;
  wire img_blue_r00_n_99;
  wire img_green_r00_n_100;
  wire img_green_r00_n_101;
  wire img_green_r00_n_102;
  wire img_green_r00_n_103;
  wire img_green_r00_n_104;
  wire img_green_r00_n_105;
  wire img_green_r00_n_90;
  wire img_green_r00_n_91;
  wire img_green_r00_n_92;
  wire img_green_r00_n_93;
  wire img_green_r00_n_94;
  wire img_green_r00_n_95;
  wire img_green_r00_n_96;
  wire img_green_r00_n_97;
  wire img_green_r00_n_98;
  wire img_green_r00_n_99;
  wire img_red_r00_n_100;
  wire img_red_r00_n_101;
  wire img_red_r00_n_102;
  wire img_red_r00_n_103;
  wire img_red_r00_n_104;
  wire img_red_r00_n_105;
  wire img_red_r00_n_91;
  wire img_red_r00_n_92;
  wire img_red_r00_n_93;
  wire img_red_r00_n_94;
  wire img_red_r00_n_95;
  wire img_red_r00_n_96;
  wire img_red_r00_n_97;
  wire img_red_r00_n_98;
  wire img_red_r00_n_99;
  wire [7:0]p_0_in;
  wire per_frame_clken;
  wire [1:0]per_frame_clken_r;
  wire per_frame_href;
  wire [1:0]per_frame_href_r;
  wire per_frame_vsync;
  wire [1:0]per_frame_vsync_r;
  wire [23:0]per_img_rgb888;
  wire post_frame_clken;
  wire post_frame_vsync;
  wire [7:0]post_img_gray;
  wire rst_n;
  wire rst_n_0;
  wire [3:0]\NLW_img_Y_r0_reg[11]_i_11_O_UNCONNECTED ;
  wire [3:0]\NLW_img_Y_r0_reg[11]_i_2_O_UNCONNECTED ;
  wire [3:3]\NLW_img_Y_r0_reg[15]_i_1_CO_UNCONNECTED ;
  wire NLW_img_blue_r00_CARRYCASCOUT_UNCONNECTED;
  wire NLW_img_blue_r00_MULTSIGNOUT_UNCONNECTED;
  wire NLW_img_blue_r00_OVERFLOW_UNCONNECTED;
  wire NLW_img_blue_r00_PATTERNBDETECT_UNCONNECTED;
  wire NLW_img_blue_r00_PATTERNDETECT_UNCONNECTED;
  wire NLW_img_blue_r00_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_img_blue_r00_ACOUT_UNCONNECTED;
  wire [17:0]NLW_img_blue_r00_BCOUT_UNCONNECTED;
  wire [3:0]NLW_img_blue_r00_CARRYOUT_UNCONNECTED;
  wire [47:13]NLW_img_blue_r00_P_UNCONNECTED;
  wire [47:0]NLW_img_blue_r00_PCOUT_UNCONNECTED;
  wire NLW_img_green_r00_CARRYCASCOUT_UNCONNECTED;
  wire NLW_img_green_r00_MULTSIGNOUT_UNCONNECTED;
  wire NLW_img_green_r00_OVERFLOW_UNCONNECTED;
  wire NLW_img_green_r00_PATTERNBDETECT_UNCONNECTED;
  wire NLW_img_green_r00_PATTERNDETECT_UNCONNECTED;
  wire NLW_img_green_r00_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_img_green_r00_ACOUT_UNCONNECTED;
  wire [17:0]NLW_img_green_r00_BCOUT_UNCONNECTED;
  wire [3:0]NLW_img_green_r00_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_img_green_r00_P_UNCONNECTED;
  wire [47:0]NLW_img_green_r00_PCOUT_UNCONNECTED;
  wire NLW_img_red_r00_CARRYCASCOUT_UNCONNECTED;
  wire NLW_img_red_r00_MULTSIGNOUT_UNCONNECTED;
  wire NLW_img_red_r00_OVERFLOW_UNCONNECTED;
  wire NLW_img_red_r00_PATTERNBDETECT_UNCONNECTED;
  wire NLW_img_red_r00_PATTERNDETECT_UNCONNECTED;
  wire NLW_img_red_r00_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_img_red_r00_ACOUT_UNCONNECTED;
  wire [17:0]NLW_img_red_r00_BCOUT_UNCONNECTED;
  wire [3:0]NLW_img_red_r00_CARRYOUT_UNCONNECTED;
  wire [47:15]NLW_img_red_r00_P_UNCONNECTED;
  wire [47:0]NLW_img_red_r00_PCOUT_UNCONNECTED;

  (* HLUTNM = "lutpair8" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_10 
       (.I0(img_green_r00_n_97),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_97),
        .I3(img_red_r00_n_97),
        .I4(\img_Y_r0[11]_i_6_n_0 ),
        .O(\img_Y_r0[11]_i_10_n_0 ));
  (* HLUTNM = "lutpair6" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_12 
       (.I0(img_green_r00_n_99),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_99),
        .I3(img_red_r00_n_99),
        .O(\img_Y_r0[11]_i_12_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_13 
       (.I0(img_green_r00_n_100),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_100),
        .I3(img_red_r00_n_100),
        .O(\img_Y_r0[11]_i_13_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_14 
       (.I0(img_green_r00_n_101),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_101),
        .I3(img_red_r00_n_101),
        .O(\img_Y_r0[11]_i_14_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_15 
       (.I0(img_green_r00_n_102),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_102),
        .I3(img_red_r00_n_102),
        .O(\img_Y_r0[11]_i_15_n_0 ));
  (* HLUTNM = "lutpair7" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_16 
       (.I0(img_green_r00_n_98),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_98),
        .I3(img_red_r00_n_98),
        .I4(\img_Y_r0[11]_i_12_n_0 ),
        .O(\img_Y_r0[11]_i_16_n_0 ));
  (* HLUTNM = "lutpair6" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_17 
       (.I0(img_green_r00_n_99),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_99),
        .I3(img_red_r00_n_99),
        .I4(\img_Y_r0[11]_i_13_n_0 ),
        .O(\img_Y_r0[11]_i_17_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_18 
       (.I0(img_green_r00_n_100),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_100),
        .I3(img_red_r00_n_100),
        .I4(\img_Y_r0[11]_i_14_n_0 ),
        .O(\img_Y_r0[11]_i_18_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_19 
       (.I0(img_green_r00_n_101),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_101),
        .I3(img_red_r00_n_101),
        .I4(\img_Y_r0[11]_i_15_n_0 ),
        .O(\img_Y_r0[11]_i_19_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_20 
       (.I0(img_green_r00_n_103),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_103),
        .I3(img_red_r00_n_103),
        .O(\img_Y_r0[11]_i_20_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_21 
       (.I0(img_green_r00_n_104),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_104),
        .I3(img_red_r00_n_104),
        .O(\img_Y_r0[11]_i_21_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_22 
       (.I0(img_green_r00_n_105),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_105),
        .I3(img_red_r00_n_105),
        .O(\img_Y_r0[11]_i_22_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_23 
       (.I0(img_green_r00_n_102),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_102),
        .I3(img_red_r00_n_102),
        .I4(\img_Y_r0[11]_i_20_n_0 ),
        .O(\img_Y_r0[11]_i_23_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_24 
       (.I0(img_green_r00_n_103),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_103),
        .I3(img_red_r00_n_103),
        .I4(\img_Y_r0[11]_i_21_n_0 ),
        .O(\img_Y_r0[11]_i_24_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_25 
       (.I0(img_green_r00_n_104),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_104),
        .I3(img_red_r00_n_104),
        .I4(\img_Y_r0[11]_i_22_n_0 ),
        .O(\img_Y_r0[11]_i_25_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h8448)) 
    \img_Y_r0[11]_i_26 
       (.I0(img_green_r00_n_105),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_105),
        .I3(img_red_r00_n_105),
        .O(\img_Y_r0[11]_i_26_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_3 
       (.I0(img_green_r00_n_95),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_95),
        .I3(img_red_r00_n_95),
        .O(\img_Y_r0[11]_i_3_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_4 
       (.I0(img_green_r00_n_96),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_96),
        .I3(img_red_r00_n_96),
        .O(\img_Y_r0[11]_i_4_n_0 ));
  (* HLUTNM = "lutpair8" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_5 
       (.I0(img_green_r00_n_97),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_97),
        .I3(img_red_r00_n_97),
        .O(\img_Y_r0[11]_i_5_n_0 ));
  (* HLUTNM = "lutpair7" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[11]_i_6 
       (.I0(img_green_r00_n_98),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_98),
        .I3(img_red_r00_n_98),
        .O(\img_Y_r0[11]_i_6_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_7 
       (.I0(img_green_r00_n_94),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_94),
        .I3(img_red_r00_n_94),
        .I4(\img_Y_r0[11]_i_3_n_0 ),
        .O(\img_Y_r0[11]_i_7_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_8 
       (.I0(img_green_r00_n_95),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_95),
        .I3(img_red_r00_n_95),
        .I4(\img_Y_r0[11]_i_4_n_0 ),
        .O(\img_Y_r0[11]_i_8_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT5 #(
    .INIT(32'h7BB78448)) 
    \img_Y_r0[11]_i_9 
       (.I0(img_green_r00_n_96),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_96),
        .I3(img_red_r00_n_96),
        .I4(\img_Y_r0[11]_i_5_n_0 ),
        .O(\img_Y_r0[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \img_Y_r0[15]_i_2 
       (.I0(img_red_r00_n_92),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_green_r00_n_92),
        .O(\img_Y_r0[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[15]_i_3 
       (.I0(img_green_r00_n_93),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_93),
        .I3(img_red_r00_n_93),
        .O(\img_Y_r0[15]_i_3_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT4 #(
    .INIT(16'hC880)) 
    \img_Y_r0[15]_i_4 
       (.I0(img_green_r00_n_94),
        .I1(\img_Y_r0_reg[15]_0 ),
        .I2(img_blue_r00_n_94),
        .I3(img_red_r00_n_94),
        .O(\img_Y_r0[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7080)) 
    \img_Y_r0[15]_i_5 
       (.I0(img_red_r00_n_91),
        .I1(img_green_r00_n_91),
        .I2(\img_Y_r0_reg[15]_0 ),
        .I3(img_green_r00_n_90),
        .O(\img_Y_r0[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h87007800)) 
    \img_Y_r0[15]_i_6 
       (.I0(img_red_r00_n_92),
        .I1(img_green_r00_n_92),
        .I2(img_green_r00_n_91),
        .I3(\img_Y_r0_reg[15]_0 ),
        .I4(img_red_r00_n_91),
        .O(\img_Y_r0[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hE817000017E80000)) 
    \img_Y_r0[15]_i_7 
       (.I0(img_red_r00_n_93),
        .I1(img_blue_r00_n_93),
        .I2(img_green_r00_n_93),
        .I3(img_green_r00_n_92),
        .I4(\img_Y_r0_reg[15]_0 ),
        .I5(img_red_r00_n_92),
        .O(\img_Y_r0[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6A9A9A6A)) 
    \img_Y_r0[15]_i_8 
       (.I0(\img_Y_r0[15]_i_4_n_0 ),
        .I1(img_blue_r00_n_93),
        .I2(\img_Y_r0_reg[15]_0 ),
        .I3(img_green_r00_n_93),
        .I4(img_red_r00_n_93),
        .O(\img_Y_r0[15]_i_8_n_0 ));
  FDCE \img_Y_r0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[11]_i_1_n_5 ),
        .Q(p_0_in[2]));
  FDCE \img_Y_r0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[11]_i_1_n_4 ),
        .Q(p_0_in[3]));
  CARRY4 \img_Y_r0_reg[11]_i_1 
       (.CI(\img_Y_r0_reg[11]_i_2_n_0 ),
        .CO({\img_Y_r0_reg[11]_i_1_n_0 ,\img_Y_r0_reg[11]_i_1_n_1 ,\img_Y_r0_reg[11]_i_1_n_2 ,\img_Y_r0_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\img_Y_r0[11]_i_3_n_0 ,\img_Y_r0[11]_i_4_n_0 ,\img_Y_r0[11]_i_5_n_0 ,\img_Y_r0[11]_i_6_n_0 }),
        .O({\img_Y_r0_reg[11]_i_1_n_4 ,\img_Y_r0_reg[11]_i_1_n_5 ,\img_Y_r0_reg[11]_i_1_n_6 ,\img_Y_r0_reg[11]_i_1_n_7 }),
        .S({\img_Y_r0[11]_i_7_n_0 ,\img_Y_r0[11]_i_8_n_0 ,\img_Y_r0[11]_i_9_n_0 ,\img_Y_r0[11]_i_10_n_0 }));
  CARRY4 \img_Y_r0_reg[11]_i_11 
       (.CI(1'b0),
        .CO({\img_Y_r0_reg[11]_i_11_n_0 ,\img_Y_r0_reg[11]_i_11_n_1 ,\img_Y_r0_reg[11]_i_11_n_2 ,\img_Y_r0_reg[11]_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({\img_Y_r0[11]_i_20_n_0 ,\img_Y_r0[11]_i_21_n_0 ,\img_Y_r0[11]_i_22_n_0 ,1'b0}),
        .O(\NLW_img_Y_r0_reg[11]_i_11_O_UNCONNECTED [3:0]),
        .S({\img_Y_r0[11]_i_23_n_0 ,\img_Y_r0[11]_i_24_n_0 ,\img_Y_r0[11]_i_25_n_0 ,\img_Y_r0[11]_i_26_n_0 }));
  CARRY4 \img_Y_r0_reg[11]_i_2 
       (.CI(\img_Y_r0_reg[11]_i_11_n_0 ),
        .CO({\img_Y_r0_reg[11]_i_2_n_0 ,\img_Y_r0_reg[11]_i_2_n_1 ,\img_Y_r0_reg[11]_i_2_n_2 ,\img_Y_r0_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\img_Y_r0[11]_i_12_n_0 ,\img_Y_r0[11]_i_13_n_0 ,\img_Y_r0[11]_i_14_n_0 ,\img_Y_r0[11]_i_15_n_0 }),
        .O(\NLW_img_Y_r0_reg[11]_i_2_O_UNCONNECTED [3:0]),
        .S({\img_Y_r0[11]_i_16_n_0 ,\img_Y_r0[11]_i_17_n_0 ,\img_Y_r0[11]_i_18_n_0 ,\img_Y_r0[11]_i_19_n_0 }));
  FDCE \img_Y_r0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[15]_i_1_n_7 ),
        .Q(p_0_in[4]));
  FDCE \img_Y_r0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[15]_i_1_n_6 ),
        .Q(p_0_in[5]));
  FDCE \img_Y_r0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[15]_i_1_n_5 ),
        .Q(p_0_in[6]));
  FDCE \img_Y_r0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[15]_i_1_n_4 ),
        .Q(p_0_in[7]));
  CARRY4 \img_Y_r0_reg[15]_i_1 
       (.CI(\img_Y_r0_reg[11]_i_1_n_0 ),
        .CO({\NLW_img_Y_r0_reg[15]_i_1_CO_UNCONNECTED [3],\img_Y_r0_reg[15]_i_1_n_1 ,\img_Y_r0_reg[15]_i_1_n_2 ,\img_Y_r0_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\img_Y_r0[15]_i_2_n_0 ,\img_Y_r0[15]_i_3_n_0 ,\img_Y_r0[15]_i_4_n_0 }),
        .O({\img_Y_r0_reg[15]_i_1_n_4 ,\img_Y_r0_reg[15]_i_1_n_5 ,\img_Y_r0_reg[15]_i_1_n_6 ,\img_Y_r0_reg[15]_i_1_n_7 }),
        .S({\img_Y_r0[15]_i_5_n_0 ,\img_Y_r0[15]_i_6_n_0 ,\img_Y_r0[15]_i_7_n_0 ,\img_Y_r0[15]_i_8_n_0 }));
  FDCE \img_Y_r0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[11]_i_1_n_7 ),
        .Q(p_0_in[0]));
  FDCE \img_Y_r0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(\img_Y_r0_reg[11]_i_1_n_6 ),
        .Q(p_0_in[1]));
  FDCE \img_Y_r1_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[0]),
        .Q(img_Y_r1[0]));
  FDCE \img_Y_r1_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[1]),
        .Q(img_Y_r1[1]));
  FDCE \img_Y_r1_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[2]),
        .Q(img_Y_r1[2]));
  FDCE \img_Y_r1_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[3]),
        .Q(img_Y_r1[3]));
  FDCE \img_Y_r1_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[4]),
        .Q(img_Y_r1[4]));
  FDCE \img_Y_r1_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[5]),
        .Q(img_Y_r1[5]));
  FDCE \img_Y_r1_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[6]),
        .Q(img_Y_r1[6]));
  FDCE \img_Y_r1_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(p_0_in[7]),
        .Q(img_Y_r1[7]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    img_blue_r00
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,per_img_rgb888[7:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_img_blue_r00_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_img_blue_r00_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_img_blue_r00_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_img_blue_r00_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_img_blue_r00_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_img_blue_r00_OVERFLOW_UNCONNECTED),
        .P({NLW_img_blue_r00_P_UNCONNECTED[47:13],img_blue_r00_n_93,img_blue_r00_n_94,img_blue_r00_n_95,img_blue_r00_n_96,img_blue_r00_n_97,img_blue_r00_n_98,img_blue_r00_n_99,img_blue_r00_n_100,img_blue_r00_n_101,img_blue_r00_n_102,img_blue_r00_n_103,img_blue_r00_n_104,img_blue_r00_n_105}),
        .PATTERNBDETECT(NLW_img_blue_r00_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_img_blue_r00_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_img_blue_r00_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_img_blue_r00_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    img_green_r00
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,per_img_rgb888[15:8]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_img_green_r00_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_img_green_r00_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_img_green_r00_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_img_green_r00_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_img_green_r00_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_img_green_r00_OVERFLOW_UNCONNECTED),
        .P({NLW_img_green_r00_P_UNCONNECTED[47:16],img_green_r00_n_90,img_green_r00_n_91,img_green_r00_n_92,img_green_r00_n_93,img_green_r00_n_94,img_green_r00_n_95,img_green_r00_n_96,img_green_r00_n_97,img_green_r00_n_98,img_green_r00_n_99,img_green_r00_n_100,img_green_r00_n_101,img_green_r00_n_102,img_green_r00_n_103,img_green_r00_n_104,img_green_r00_n_105}),
        .PATTERNBDETECT(NLW_img_green_r00_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_img_green_r00_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_img_green_r00_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_img_green_r00_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    img_red_r00
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,per_img_rgb888[23:16]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_img_red_r00_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_img_red_r00_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_img_red_r00_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_img_red_r00_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_img_red_r00_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_img_red_r00_OVERFLOW_UNCONNECTED),
        .P({NLW_img_red_r00_P_UNCONNECTED[47:15],img_red_r00_n_91,img_red_r00_n_92,img_red_r00_n_93,img_red_r00_n_94,img_red_r00_n_95,img_red_r00_n_96,img_red_r00_n_97,img_red_r00_n_98,img_red_r00_n_99,img_red_r00_n_100,img_red_r00_n_101,img_red_r00_n_102,img_red_r00_n_103,img_red_r00_n_104,img_red_r00_n_105}),
        .PATTERNBDETECT(NLW_img_red_r00_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_img_red_r00_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_img_red_r00_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_img_red_r00_UNDERFLOW_UNCONNECTED));
  FDCE \per_frame_clken_r_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_clken),
        .Q(per_frame_clken_r[0]));
  FDCE \per_frame_clken_r_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_clken_r[0]),
        .Q(per_frame_clken_r[1]));
  FDCE \per_frame_clken_r_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_clken_r[1]),
        .Q(post_frame_clken));
  FDCE \per_frame_href_r_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_href),
        .Q(per_frame_href_r[0]));
  FDCE \per_frame_href_r_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_href_r[0]),
        .Q(per_frame_href_r[1]));
  FDCE \per_frame_href_r_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_href_r[1]),
        .Q(Q));
  LUT1 #(
    .INIT(2'h1)) 
    \per_frame_vsync_r[2]_i_1 
       (.I0(rst_n),
        .O(rst_n_0));
  FDCE \per_frame_vsync_r_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_vsync),
        .Q(per_frame_vsync_r[0]));
  FDCE \per_frame_vsync_r_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_vsync_r[0]),
        .Q(per_frame_vsync_r[1]));
  FDCE \per_frame_vsync_r_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_n_0),
        .D(per_frame_vsync_r[1]),
        .Q(post_frame_vsync));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[0]_INST_0 
       (.I0(img_Y_r1[0]),
        .I1(Q),
        .O(post_img_gray[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[1]_INST_0 
       (.I0(img_Y_r1[1]),
        .I1(Q),
        .O(post_img_gray[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[2]_INST_0 
       (.I0(img_Y_r1[2]),
        .I1(Q),
        .O(post_img_gray[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[3]_INST_0 
       (.I0(img_Y_r1[3]),
        .I1(Q),
        .O(post_img_gray[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[4]_INST_0 
       (.I0(img_Y_r1[4]),
        .I1(Q),
        .O(post_img_gray[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[5]_INST_0 
       (.I0(img_Y_r1[5]),
        .I1(Q),
        .O(post_img_gray[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[6]_INST_0 
       (.I0(img_Y_r1[6]),
        .I1(Q),
        .O(post_img_gray[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \post_img_gray[7]_INST_0 
       (.I0(img_Y_r1[7]),
        .I1(Q),
        .O(post_img_gray[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
