-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Jul 28 11:49:35 2020
-- Host        : CrazyWei running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               H:/Desktop/fdma_demo/VIP_Gray_Frame_Difference_v3/VIP_Gray_Frame_Difference_v3.srcs/sources_1/ip/sys_clk_ctrl/sys_clk_ctrl_stub.vhdl
-- Design      : sys_clk_ctrl
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sys_clk_ctrl is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end sys_clk_ctrl;

architecture stub of sys_clk_ctrl is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,clk_out3,resetn,locked,clk_in1";
begin
end;
