-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Jul  7 14:03:12 2020
-- Host        : CrazyWei running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               h:/Desktop/fdma_demo/VIP_Gray_Med/VIP_Gray_Med.srcs/sources_1/ip/VIP_RGB888_YCbCr444_0/VIP_RGB888_YCbCr444_0_sim_netlist.vhdl
-- Design      : VIP_RGB888_YCbCr444_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444 is
  port (
    post_frame_vsync : out STD_LOGIC;
    rst_n_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    post_frame_clken : out STD_LOGIC;
    post_img_gray : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \img_Y_r0_reg[15]_0\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    per_frame_vsync : in STD_LOGIC;
    per_frame_href : in STD_LOGIC;
    per_frame_clken : in STD_LOGIC;
    per_img_rgb888 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444 : entity is "VIP_RGB888_YCbCr444";
end VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444;

architecture STRUCTURE of VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444 is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \img_Y_r0[11]_i_10_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_12_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_13_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_14_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_15_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_16_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_17_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_18_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_19_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_20_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_21_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_22_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_23_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_24_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_25_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_26_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_3_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_4_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_5_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_6_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_7_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_8_n_0\ : STD_LOGIC;
  signal \img_Y_r0[11]_i_9_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_2_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_3_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_4_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_5_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_6_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_7_n_0\ : STD_LOGIC;
  signal \img_Y_r0[15]_i_8_n_0\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_11_n_0\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_11_n_1\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_11_n_2\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_11_n_3\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \img_Y_r0_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \img_Y_r0_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal img_Y_r1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal img_blue_r00_n_100 : STD_LOGIC;
  signal img_blue_r00_n_101 : STD_LOGIC;
  signal img_blue_r00_n_102 : STD_LOGIC;
  signal img_blue_r00_n_103 : STD_LOGIC;
  signal img_blue_r00_n_104 : STD_LOGIC;
  signal img_blue_r00_n_105 : STD_LOGIC;
  signal img_blue_r00_n_93 : STD_LOGIC;
  signal img_blue_r00_n_94 : STD_LOGIC;
  signal img_blue_r00_n_95 : STD_LOGIC;
  signal img_blue_r00_n_96 : STD_LOGIC;
  signal img_blue_r00_n_97 : STD_LOGIC;
  signal img_blue_r00_n_98 : STD_LOGIC;
  signal img_blue_r00_n_99 : STD_LOGIC;
  signal img_green_r00_n_100 : STD_LOGIC;
  signal img_green_r00_n_101 : STD_LOGIC;
  signal img_green_r00_n_102 : STD_LOGIC;
  signal img_green_r00_n_103 : STD_LOGIC;
  signal img_green_r00_n_104 : STD_LOGIC;
  signal img_green_r00_n_105 : STD_LOGIC;
  signal img_green_r00_n_90 : STD_LOGIC;
  signal img_green_r00_n_91 : STD_LOGIC;
  signal img_green_r00_n_92 : STD_LOGIC;
  signal img_green_r00_n_93 : STD_LOGIC;
  signal img_green_r00_n_94 : STD_LOGIC;
  signal img_green_r00_n_95 : STD_LOGIC;
  signal img_green_r00_n_96 : STD_LOGIC;
  signal img_green_r00_n_97 : STD_LOGIC;
  signal img_green_r00_n_98 : STD_LOGIC;
  signal img_green_r00_n_99 : STD_LOGIC;
  signal img_red_r00_n_100 : STD_LOGIC;
  signal img_red_r00_n_101 : STD_LOGIC;
  signal img_red_r00_n_102 : STD_LOGIC;
  signal img_red_r00_n_103 : STD_LOGIC;
  signal img_red_r00_n_104 : STD_LOGIC;
  signal img_red_r00_n_105 : STD_LOGIC;
  signal img_red_r00_n_91 : STD_LOGIC;
  signal img_red_r00_n_92 : STD_LOGIC;
  signal img_red_r00_n_93 : STD_LOGIC;
  signal img_red_r00_n_94 : STD_LOGIC;
  signal img_red_r00_n_95 : STD_LOGIC;
  signal img_red_r00_n_96 : STD_LOGIC;
  signal img_red_r00_n_97 : STD_LOGIC;
  signal img_red_r00_n_98 : STD_LOGIC;
  signal img_red_r00_n_99 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal per_frame_clken_r : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal per_frame_href_r : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal per_frame_vsync_r : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^rst_n_0\ : STD_LOGIC;
  signal \NLW_img_Y_r0_reg[11]_i_11_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_img_Y_r0_reg[11]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_img_Y_r0_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_img_blue_r00_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_blue_r00_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_img_blue_r00_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_img_blue_r00_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_img_blue_r00_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 13 );
  signal NLW_img_blue_r00_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_img_green_r00_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_green_r00_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_img_green_r00_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_img_green_r00_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_img_green_r00_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal NLW_img_green_r00_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_img_red_r00_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_img_red_r00_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_img_red_r00_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_img_red_r00_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_img_red_r00_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 15 );
  signal NLW_img_red_r00_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute HLUTNM : string;
  attribute HLUTNM of \img_Y_r0[11]_i_10\ : label is "lutpair8";
  attribute HLUTNM of \img_Y_r0[11]_i_12\ : label is "lutpair6";
  attribute HLUTNM of \img_Y_r0[11]_i_13\ : label is "lutpair5";
  attribute HLUTNM of \img_Y_r0[11]_i_14\ : label is "lutpair4";
  attribute HLUTNM of \img_Y_r0[11]_i_15\ : label is "lutpair3";
  attribute HLUTNM of \img_Y_r0[11]_i_16\ : label is "lutpair7";
  attribute HLUTNM of \img_Y_r0[11]_i_17\ : label is "lutpair6";
  attribute HLUTNM of \img_Y_r0[11]_i_18\ : label is "lutpair5";
  attribute HLUTNM of \img_Y_r0[11]_i_19\ : label is "lutpair4";
  attribute HLUTNM of \img_Y_r0[11]_i_20\ : label is "lutpair2";
  attribute HLUTNM of \img_Y_r0[11]_i_21\ : label is "lutpair1";
  attribute HLUTNM of \img_Y_r0[11]_i_22\ : label is "lutpair0";
  attribute HLUTNM of \img_Y_r0[11]_i_23\ : label is "lutpair3";
  attribute HLUTNM of \img_Y_r0[11]_i_24\ : label is "lutpair2";
  attribute HLUTNM of \img_Y_r0[11]_i_25\ : label is "lutpair1";
  attribute HLUTNM of \img_Y_r0[11]_i_26\ : label is "lutpair0";
  attribute HLUTNM of \img_Y_r0[11]_i_3\ : label is "lutpair10";
  attribute HLUTNM of \img_Y_r0[11]_i_4\ : label is "lutpair9";
  attribute HLUTNM of \img_Y_r0[11]_i_5\ : label is "lutpair8";
  attribute HLUTNM of \img_Y_r0[11]_i_6\ : label is "lutpair7";
  attribute HLUTNM of \img_Y_r0[11]_i_7\ : label is "lutpair11";
  attribute HLUTNM of \img_Y_r0[11]_i_8\ : label is "lutpair10";
  attribute HLUTNM of \img_Y_r0[11]_i_9\ : label is "lutpair9";
  attribute HLUTNM of \img_Y_r0[15]_i_4\ : label is "lutpair11";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of img_blue_r00 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of img_green_r00 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of img_red_r00 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \post_img_gray[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \post_img_gray[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \post_img_gray[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \post_img_gray[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \post_img_gray[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \post_img_gray[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \post_img_gray[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \post_img_gray[7]_INST_0\ : label is "soft_lutpair3";
begin
  Q(0) <= \^q\(0);
  rst_n_0 <= \^rst_n_0\;
\img_Y_r0[11]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_97,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_97,
      I3 => img_red_r00_n_97,
      I4 => \img_Y_r0[11]_i_6_n_0\,
      O => \img_Y_r0[11]_i_10_n_0\
    );
\img_Y_r0[11]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_99,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_99,
      I3 => img_red_r00_n_99,
      O => \img_Y_r0[11]_i_12_n_0\
    );
\img_Y_r0[11]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_100,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_100,
      I3 => img_red_r00_n_100,
      O => \img_Y_r0[11]_i_13_n_0\
    );
\img_Y_r0[11]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_101,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_101,
      I3 => img_red_r00_n_101,
      O => \img_Y_r0[11]_i_14_n_0\
    );
\img_Y_r0[11]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_102,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_102,
      I3 => img_red_r00_n_102,
      O => \img_Y_r0[11]_i_15_n_0\
    );
\img_Y_r0[11]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_98,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_98,
      I3 => img_red_r00_n_98,
      I4 => \img_Y_r0[11]_i_12_n_0\,
      O => \img_Y_r0[11]_i_16_n_0\
    );
\img_Y_r0[11]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_99,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_99,
      I3 => img_red_r00_n_99,
      I4 => \img_Y_r0[11]_i_13_n_0\,
      O => \img_Y_r0[11]_i_17_n_0\
    );
\img_Y_r0[11]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_100,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_100,
      I3 => img_red_r00_n_100,
      I4 => \img_Y_r0[11]_i_14_n_0\,
      O => \img_Y_r0[11]_i_18_n_0\
    );
\img_Y_r0[11]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_101,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_101,
      I3 => img_red_r00_n_101,
      I4 => \img_Y_r0[11]_i_15_n_0\,
      O => \img_Y_r0[11]_i_19_n_0\
    );
\img_Y_r0[11]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_103,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_103,
      I3 => img_red_r00_n_103,
      O => \img_Y_r0[11]_i_20_n_0\
    );
\img_Y_r0[11]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_104,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_104,
      I3 => img_red_r00_n_104,
      O => \img_Y_r0[11]_i_21_n_0\
    );
\img_Y_r0[11]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_105,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_105,
      I3 => img_red_r00_n_105,
      O => \img_Y_r0[11]_i_22_n_0\
    );
\img_Y_r0[11]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_102,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_102,
      I3 => img_red_r00_n_102,
      I4 => \img_Y_r0[11]_i_20_n_0\,
      O => \img_Y_r0[11]_i_23_n_0\
    );
\img_Y_r0[11]_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_103,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_103,
      I3 => img_red_r00_n_103,
      I4 => \img_Y_r0[11]_i_21_n_0\,
      O => \img_Y_r0[11]_i_24_n_0\
    );
\img_Y_r0[11]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_104,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_104,
      I3 => img_red_r00_n_104,
      I4 => \img_Y_r0[11]_i_22_n_0\,
      O => \img_Y_r0[11]_i_25_n_0\
    );
\img_Y_r0[11]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8448"
    )
        port map (
      I0 => img_green_r00_n_105,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_105,
      I3 => img_red_r00_n_105,
      O => \img_Y_r0[11]_i_26_n_0\
    );
\img_Y_r0[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_95,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_95,
      I3 => img_red_r00_n_95,
      O => \img_Y_r0[11]_i_3_n_0\
    );
\img_Y_r0[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_96,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_96,
      I3 => img_red_r00_n_96,
      O => \img_Y_r0[11]_i_4_n_0\
    );
\img_Y_r0[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_97,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_97,
      I3 => img_red_r00_n_97,
      O => \img_Y_r0[11]_i_5_n_0\
    );
\img_Y_r0[11]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_98,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_98,
      I3 => img_red_r00_n_98,
      O => \img_Y_r0[11]_i_6_n_0\
    );
\img_Y_r0[11]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_94,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_94,
      I3 => img_red_r00_n_94,
      I4 => \img_Y_r0[11]_i_3_n_0\,
      O => \img_Y_r0[11]_i_7_n_0\
    );
\img_Y_r0[11]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_95,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_95,
      I3 => img_red_r00_n_95,
      I4 => \img_Y_r0[11]_i_4_n_0\,
      O => \img_Y_r0[11]_i_8_n_0\
    );
\img_Y_r0[11]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7BB78448"
    )
        port map (
      I0 => img_green_r00_n_96,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_96,
      I3 => img_red_r00_n_96,
      I4 => \img_Y_r0[11]_i_5_n_0\,
      O => \img_Y_r0[11]_i_9_n_0\
    );
\img_Y_r0[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => img_red_r00_n_92,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_green_r00_n_92,
      O => \img_Y_r0[15]_i_2_n_0\
    );
\img_Y_r0[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_93,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_93,
      I3 => img_red_r00_n_93,
      O => \img_Y_r0[15]_i_3_n_0\
    );
\img_Y_r0[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C880"
    )
        port map (
      I0 => img_green_r00_n_94,
      I1 => \img_Y_r0_reg[15]_0\,
      I2 => img_blue_r00_n_94,
      I3 => img_red_r00_n_94,
      O => \img_Y_r0[15]_i_4_n_0\
    );
\img_Y_r0[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => img_red_r00_n_91,
      I1 => img_green_r00_n_91,
      I2 => \img_Y_r0_reg[15]_0\,
      I3 => img_green_r00_n_90,
      O => \img_Y_r0[15]_i_5_n_0\
    );
\img_Y_r0[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"87007800"
    )
        port map (
      I0 => img_red_r00_n_92,
      I1 => img_green_r00_n_92,
      I2 => img_green_r00_n_91,
      I3 => \img_Y_r0_reg[15]_0\,
      I4 => img_red_r00_n_91,
      O => \img_Y_r0[15]_i_6_n_0\
    );
\img_Y_r0[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E817000017E80000"
    )
        port map (
      I0 => img_red_r00_n_93,
      I1 => img_blue_r00_n_93,
      I2 => img_green_r00_n_93,
      I3 => img_green_r00_n_92,
      I4 => \img_Y_r0_reg[15]_0\,
      I5 => img_red_r00_n_92,
      O => \img_Y_r0[15]_i_7_n_0\
    );
\img_Y_r0[15]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A9A9A6A"
    )
        port map (
      I0 => \img_Y_r0[15]_i_4_n_0\,
      I1 => img_blue_r00_n_93,
      I2 => \img_Y_r0_reg[15]_0\,
      I3 => img_green_r00_n_93,
      I4 => img_red_r00_n_93,
      O => \img_Y_r0[15]_i_8_n_0\
    );
\img_Y_r0_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[11]_i_1_n_5\,
      Q => p_0_in(2)
    );
\img_Y_r0_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[11]_i_1_n_4\,
      Q => p_0_in(3)
    );
\img_Y_r0_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \img_Y_r0_reg[11]_i_2_n_0\,
      CO(3) => \img_Y_r0_reg[11]_i_1_n_0\,
      CO(2) => \img_Y_r0_reg[11]_i_1_n_1\,
      CO(1) => \img_Y_r0_reg[11]_i_1_n_2\,
      CO(0) => \img_Y_r0_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \img_Y_r0[11]_i_3_n_0\,
      DI(2) => \img_Y_r0[11]_i_4_n_0\,
      DI(1) => \img_Y_r0[11]_i_5_n_0\,
      DI(0) => \img_Y_r0[11]_i_6_n_0\,
      O(3) => \img_Y_r0_reg[11]_i_1_n_4\,
      O(2) => \img_Y_r0_reg[11]_i_1_n_5\,
      O(1) => \img_Y_r0_reg[11]_i_1_n_6\,
      O(0) => \img_Y_r0_reg[11]_i_1_n_7\,
      S(3) => \img_Y_r0[11]_i_7_n_0\,
      S(2) => \img_Y_r0[11]_i_8_n_0\,
      S(1) => \img_Y_r0[11]_i_9_n_0\,
      S(0) => \img_Y_r0[11]_i_10_n_0\
    );
\img_Y_r0_reg[11]_i_11\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \img_Y_r0_reg[11]_i_11_n_0\,
      CO(2) => \img_Y_r0_reg[11]_i_11_n_1\,
      CO(1) => \img_Y_r0_reg[11]_i_11_n_2\,
      CO(0) => \img_Y_r0_reg[11]_i_11_n_3\,
      CYINIT => '0',
      DI(3) => \img_Y_r0[11]_i_20_n_0\,
      DI(2) => \img_Y_r0[11]_i_21_n_0\,
      DI(1) => \img_Y_r0[11]_i_22_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_img_Y_r0_reg[11]_i_11_O_UNCONNECTED\(3 downto 0),
      S(3) => \img_Y_r0[11]_i_23_n_0\,
      S(2) => \img_Y_r0[11]_i_24_n_0\,
      S(1) => \img_Y_r0[11]_i_25_n_0\,
      S(0) => \img_Y_r0[11]_i_26_n_0\
    );
\img_Y_r0_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \img_Y_r0_reg[11]_i_11_n_0\,
      CO(3) => \img_Y_r0_reg[11]_i_2_n_0\,
      CO(2) => \img_Y_r0_reg[11]_i_2_n_1\,
      CO(1) => \img_Y_r0_reg[11]_i_2_n_2\,
      CO(0) => \img_Y_r0_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \img_Y_r0[11]_i_12_n_0\,
      DI(2) => \img_Y_r0[11]_i_13_n_0\,
      DI(1) => \img_Y_r0[11]_i_14_n_0\,
      DI(0) => \img_Y_r0[11]_i_15_n_0\,
      O(3 downto 0) => \NLW_img_Y_r0_reg[11]_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \img_Y_r0[11]_i_16_n_0\,
      S(2) => \img_Y_r0[11]_i_17_n_0\,
      S(1) => \img_Y_r0[11]_i_18_n_0\,
      S(0) => \img_Y_r0[11]_i_19_n_0\
    );
\img_Y_r0_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[15]_i_1_n_7\,
      Q => p_0_in(4)
    );
\img_Y_r0_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[15]_i_1_n_6\,
      Q => p_0_in(5)
    );
\img_Y_r0_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[15]_i_1_n_5\,
      Q => p_0_in(6)
    );
\img_Y_r0_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[15]_i_1_n_4\,
      Q => p_0_in(7)
    );
\img_Y_r0_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \img_Y_r0_reg[11]_i_1_n_0\,
      CO(3) => \NLW_img_Y_r0_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \img_Y_r0_reg[15]_i_1_n_1\,
      CO(1) => \img_Y_r0_reg[15]_i_1_n_2\,
      CO(0) => \img_Y_r0_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \img_Y_r0[15]_i_2_n_0\,
      DI(1) => \img_Y_r0[15]_i_3_n_0\,
      DI(0) => \img_Y_r0[15]_i_4_n_0\,
      O(3) => \img_Y_r0_reg[15]_i_1_n_4\,
      O(2) => \img_Y_r0_reg[15]_i_1_n_5\,
      O(1) => \img_Y_r0_reg[15]_i_1_n_6\,
      O(0) => \img_Y_r0_reg[15]_i_1_n_7\,
      S(3) => \img_Y_r0[15]_i_5_n_0\,
      S(2) => \img_Y_r0[15]_i_6_n_0\,
      S(1) => \img_Y_r0[15]_i_7_n_0\,
      S(0) => \img_Y_r0[15]_i_8_n_0\
    );
\img_Y_r0_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[11]_i_1_n_7\,
      Q => p_0_in(0)
    );
\img_Y_r0_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => \img_Y_r0_reg[11]_i_1_n_6\,
      Q => p_0_in(1)
    );
\img_Y_r1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(0),
      Q => img_Y_r1(0)
    );
\img_Y_r1_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(1),
      Q => img_Y_r1(1)
    );
\img_Y_r1_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(2),
      Q => img_Y_r1(2)
    );
\img_Y_r1_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(3),
      Q => img_Y_r1(3)
    );
\img_Y_r1_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(4),
      Q => img_Y_r1(4)
    );
\img_Y_r1_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(5),
      Q => img_Y_r1(5)
    );
\img_Y_r1_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(6),
      Q => img_Y_r1(6)
    );
\img_Y_r1_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => p_0_in(7),
      Q => img_Y_r1(7)
    );
img_blue_r00: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => per_img_rgb888(7 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_img_blue_r00_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000000011101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_img_blue_r00_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_img_blue_r00_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_img_blue_r00_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '1',
      CLK => clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_img_blue_r00_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_img_blue_r00_OVERFLOW_UNCONNECTED,
      P(47 downto 13) => NLW_img_blue_r00_P_UNCONNECTED(47 downto 13),
      P(12) => img_blue_r00_n_93,
      P(11) => img_blue_r00_n_94,
      P(10) => img_blue_r00_n_95,
      P(9) => img_blue_r00_n_96,
      P(8) => img_blue_r00_n_97,
      P(7) => img_blue_r00_n_98,
      P(6) => img_blue_r00_n_99,
      P(5) => img_blue_r00_n_100,
      P(4) => img_blue_r00_n_101,
      P(3) => img_blue_r00_n_102,
      P(2) => img_blue_r00_n_103,
      P(1) => img_blue_r00_n_104,
      P(0) => img_blue_r00_n_105,
      PATTERNBDETECT => NLW_img_blue_r00_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_img_blue_r00_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_img_blue_r00_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_img_blue_r00_UNDERFLOW_UNCONNECTED
    );
img_green_r00: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => per_img_rgb888(15 downto 8),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_img_green_r00_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000010010110",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_img_green_r00_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_img_green_r00_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_img_green_r00_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '1',
      CLK => clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_img_green_r00_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_img_green_r00_OVERFLOW_UNCONNECTED,
      P(47 downto 16) => NLW_img_green_r00_P_UNCONNECTED(47 downto 16),
      P(15) => img_green_r00_n_90,
      P(14) => img_green_r00_n_91,
      P(13) => img_green_r00_n_92,
      P(12) => img_green_r00_n_93,
      P(11) => img_green_r00_n_94,
      P(10) => img_green_r00_n_95,
      P(9) => img_green_r00_n_96,
      P(8) => img_green_r00_n_97,
      P(7) => img_green_r00_n_98,
      P(6) => img_green_r00_n_99,
      P(5) => img_green_r00_n_100,
      P(4) => img_green_r00_n_101,
      P(3) => img_green_r00_n_102,
      P(2) => img_green_r00_n_103,
      P(1) => img_green_r00_n_104,
      P(0) => img_green_r00_n_105,
      PATTERNBDETECT => NLW_img_green_r00_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_img_green_r00_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_img_green_r00_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_img_green_r00_UNDERFLOW_UNCONNECTED
    );
img_red_r00: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => per_img_rgb888(23 downto 16),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_img_red_r00_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000001001101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_img_red_r00_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_img_red_r00_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_img_red_r00_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '1',
      CLK => clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_img_red_r00_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_img_red_r00_OVERFLOW_UNCONNECTED,
      P(47 downto 15) => NLW_img_red_r00_P_UNCONNECTED(47 downto 15),
      P(14) => img_red_r00_n_91,
      P(13) => img_red_r00_n_92,
      P(12) => img_red_r00_n_93,
      P(11) => img_red_r00_n_94,
      P(10) => img_red_r00_n_95,
      P(9) => img_red_r00_n_96,
      P(8) => img_red_r00_n_97,
      P(7) => img_red_r00_n_98,
      P(6) => img_red_r00_n_99,
      P(5) => img_red_r00_n_100,
      P(4) => img_red_r00_n_101,
      P(3) => img_red_r00_n_102,
      P(2) => img_red_r00_n_103,
      P(1) => img_red_r00_n_104,
      P(0) => img_red_r00_n_105,
      PATTERNBDETECT => NLW_img_red_r00_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_img_red_r00_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_img_red_r00_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_img_red_r00_UNDERFLOW_UNCONNECTED
    );
\per_frame_clken_r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_clken,
      Q => per_frame_clken_r(0)
    );
\per_frame_clken_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_clken_r(0),
      Q => per_frame_clken_r(1)
    );
\per_frame_clken_r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_clken_r(1),
      Q => post_frame_clken
    );
\per_frame_href_r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_href,
      Q => per_frame_href_r(0)
    );
\per_frame_href_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_href_r(0),
      Q => per_frame_href_r(1)
    );
\per_frame_href_r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_href_r(1),
      Q => \^q\(0)
    );
\per_frame_vsync_r[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \^rst_n_0\
    );
\per_frame_vsync_r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_vsync,
      Q => per_frame_vsync_r(0)
    );
\per_frame_vsync_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_vsync_r(0),
      Q => per_frame_vsync_r(1)
    );
\per_frame_vsync_r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^rst_n_0\,
      D => per_frame_vsync_r(1),
      Q => post_frame_vsync
    );
\post_img_gray[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(0),
      I1 => \^q\(0),
      O => post_img_gray(0)
    );
\post_img_gray[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(1),
      I1 => \^q\(0),
      O => post_img_gray(1)
    );
\post_img_gray[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(2),
      I1 => \^q\(0),
      O => post_img_gray(2)
    );
\post_img_gray[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(3),
      I1 => \^q\(0),
      O => post_img_gray(3)
    );
\post_img_gray[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(4),
      I1 => \^q\(0),
      O => post_img_gray(4)
    );
\post_img_gray[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(5),
      I1 => \^q\(0),
      O => post_img_gray(5)
    );
\post_img_gray[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(6),
      I1 => \^q\(0),
      O => post_img_gray(6)
    );
\post_img_gray[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => img_Y_r1(7),
      I1 => \^q\(0),
      O => post_img_gray(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity VIP_RGB888_YCbCr444_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    per_frame_vsync : in STD_LOGIC;
    per_frame_href : in STD_LOGIC;
    per_frame_clken : in STD_LOGIC;
    per_img_rgb888 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    post_frame_vsync : out STD_LOGIC;
    post_frame_href : out STD_LOGIC;
    post_frame_clken : out STD_LOGIC;
    post_img_gray : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of VIP_RGB888_YCbCr444_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of VIP_RGB888_YCbCr444_0 : entity is "VIP_RGB888_YCbCr444_0,VIP_RGB888_YCbCr444,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of VIP_RGB888_YCbCr444_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of VIP_RGB888_YCbCr444_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of VIP_RGB888_YCbCr444_0 : entity is "VIP_RGB888_YCbCr444,Vivado 2018.3";
end VIP_RGB888_YCbCr444_0;

architecture STRUCTURE of VIP_RGB888_YCbCr444_0 is
  signal \img_Y_r0_reg[15]_i_9_n_0\ : STD_LOGIC;
  signal inst_n_1 : STD_LOGIC;
  signal \^post_img_gray\ : STD_LOGIC_VECTOR ( 23 downto 16 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of per_frame_href : signal is "xilinx.com:interface:vid_io:1.0 video_per_frame ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of per_frame_vsync : signal is "xilinx.com:interface:vid_io:1.0 video_per_frame VSYNC";
  attribute X_INTERFACE_INFO of post_frame_href : signal is "xilinx.com:interface:vid_io:1.0 video_post_frame ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of post_frame_vsync : signal is "xilinx.com:interface:vid_io:1.0 video_post_frame VSYNC";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of per_img_rgb888 : signal is "xilinx.com:interface:vid_io:1.0 video_per_frame DATA";
  attribute X_INTERFACE_INFO of post_img_gray : signal is "xilinx.com:interface:vid_io:1.0 video_post_frame DATA";
begin
  post_img_gray(23 downto 16) <= \^post_img_gray\(23 downto 16);
  post_img_gray(15 downto 8) <= \^post_img_gray\(23 downto 16);
  post_img_gray(7 downto 0) <= \^post_img_gray\(23 downto 16);
\img_Y_r0_reg[15]_i_9\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => inst_n_1,
      D => '1',
      Q => \img_Y_r0_reg[15]_i_9_n_0\
    );
inst: entity work.VIP_RGB888_YCbCr444_0_VIP_RGB888_YCbCr444
     port map (
      Q(0) => post_frame_href,
      clk => clk,
      \img_Y_r0_reg[15]_0\ => \img_Y_r0_reg[15]_i_9_n_0\,
      per_frame_clken => per_frame_clken,
      per_frame_href => per_frame_href,
      per_frame_vsync => per_frame_vsync,
      per_img_rgb888(23 downto 0) => per_img_rgb888(23 downto 0),
      post_frame_clken => post_frame_clken,
      post_frame_vsync => post_frame_vsync,
      post_img_gray(7 downto 0) => \^post_img_gray\(23 downto 16),
      rst_n => rst_n,
      rst_n_0 => inst_n_1
    );
end STRUCTURE;
