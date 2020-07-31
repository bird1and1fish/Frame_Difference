-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Mon Jul  6 20:49:39 2020
-- Host        : CrazyWei running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               h:/Desktop/fdma_demo/VIP_Raw_RGB888/VIP_Raw_RGB888.srcs/sources_1/ip/VIP_RAW8_RGB888_v2_0/VIP_RAW8_RGB888_v2_0_stub.vhdl
-- Design      : VIP_RAW8_RGB888_v2_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VIP_RAW8_RGB888_v2_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    per_frame_vsync : in STD_LOGIC;
    per_frame_href : in STD_LOGIC;
    per_frame_clken : in STD_LOGIC;
    per_img_RAW : in STD_LOGIC_VECTOR ( 7 downto 0 );
    post_frame_vsync : out STD_LOGIC;
    post_frame_href : out STD_LOGIC;
    post_frame_clken : out STD_LOGIC;
    post_img_rgb888 : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );

end VIP_RAW8_RGB888_v2_0;

architecture stub of VIP_RAW8_RGB888_v2_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,per_frame_vsync,per_frame_href,per_frame_clken,per_img_RAW[7:0],post_frame_vsync,post_frame_href,post_frame_clken,post_img_rgb888[23:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "VIP_RAW8_RGB888_v2,Vivado 2018.3";
begin
end;
