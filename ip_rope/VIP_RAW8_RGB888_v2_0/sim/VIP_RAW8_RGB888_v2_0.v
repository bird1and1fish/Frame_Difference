// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: zzw:zzw:VIP_RAW8_RGB888_v2:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module VIP_RAW8_RGB888_v2_0 (
  clk,
  rst_n,
  per_frame_vsync,
  per_frame_href,
  per_frame_clken,
  per_img_RAW,
  post_frame_vsync,
  post_frame_href,
  post_frame_clken,
  post_img_rgb888
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame VSYNC" *)
input wire per_frame_vsync;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame ACTIVE_VIDEO" *)
input wire per_frame_href;
input wire per_frame_clken;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_per_frame DATA" *)
input wire [7 : 0] per_img_RAW;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame VSYNC" *)
output wire post_frame_vsync;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame ACTIVE_VIDEO" *)
output wire post_frame_href;
output wire post_frame_clken;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 video_post_frame DATA" *)
output wire [23 : 0] post_img_rgb888;

  VIP_RAW8_RGB888_v2 #(
    .IMG_HDISP(640),
    .IMG_VDISP(480)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .per_frame_vsync(per_frame_vsync),
    .per_frame_href(per_frame_href),
    .per_frame_clken(per_frame_clken),
    .per_img_RAW(per_img_RAW),
    .post_frame_vsync(post_frame_vsync),
    .post_frame_href(post_frame_href),
    .post_frame_clken(post_frame_clken),
    .post_img_rgb888(post_img_rgb888)
  );
endmodule
