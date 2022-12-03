--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Sun Jun  5 10:09:40 2022
--Host        : DESKTOP-AJV8A0J running 64-bit major release  (build 9200)
--Command     : generate_target Pmod_AD2_wrapper.bd
--Design      : Pmod_AD2_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Pmod_AD2_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    Pmod_out_0_pin10_io : inout STD_LOGIC;
    Pmod_out_0_pin1_io : inout STD_LOGIC;
    Pmod_out_0_pin2_io : inout STD_LOGIC;
    Pmod_out_0_pin3_io : inout STD_LOGIC;
    Pmod_out_0_pin4_io : inout STD_LOGIC;
    Pmod_out_0_pin7_io : inout STD_LOGIC;
    Pmod_out_0_pin8_io : inout STD_LOGIC;
    Pmod_out_0_pin9_io : inout STD_LOGIC
  );
end Pmod_AD2_wrapper;

architecture STRUCTURE of Pmod_AD2_wrapper is
  component Pmod_AD2 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    Pmod_out_0_pin1_o : out STD_LOGIC;
    Pmod_out_0_pin7_i : in STD_LOGIC;
    Pmod_out_0_pin2_o : out STD_LOGIC;
    Pmod_out_0_pin8_i : in STD_LOGIC;
    Pmod_out_0_pin3_o : out STD_LOGIC;
    Pmod_out_0_pin9_i : in STD_LOGIC;
    Pmod_out_0_pin10_o : out STD_LOGIC;
    Pmod_out_0_pin4_o : out STD_LOGIC;
    Pmod_out_0_pin3_i : in STD_LOGIC;
    Pmod_out_0_pin4_i : in STD_LOGIC;
    Pmod_out_0_pin1_i : in STD_LOGIC;
    Pmod_out_0_pin2_i : in STD_LOGIC;
    Pmod_out_0_pin10_t : out STD_LOGIC;
    Pmod_out_0_pin8_t : out STD_LOGIC;
    Pmod_out_0_pin9_t : out STD_LOGIC;
    Pmod_out_0_pin4_t : out STD_LOGIC;
    Pmod_out_0_pin9_o : out STD_LOGIC;
    Pmod_out_0_pin10_i : in STD_LOGIC;
    Pmod_out_0_pin7_t : out STD_LOGIC;
    Pmod_out_0_pin1_t : out STD_LOGIC;
    Pmod_out_0_pin2_t : out STD_LOGIC;
    Pmod_out_0_pin7_o : out STD_LOGIC;
    Pmod_out_0_pin3_t : out STD_LOGIC;
    Pmod_out_0_pin8_o : out STD_LOGIC
  );
  end component Pmod_AD2;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal Pmod_out_0_pin10_i : STD_LOGIC;
  signal Pmod_out_0_pin10_o : STD_LOGIC;
  signal Pmod_out_0_pin10_t : STD_LOGIC;
  signal Pmod_out_0_pin1_i : STD_LOGIC;
  signal Pmod_out_0_pin1_o : STD_LOGIC;
  signal Pmod_out_0_pin1_t : STD_LOGIC;
  signal Pmod_out_0_pin2_i : STD_LOGIC;
  signal Pmod_out_0_pin2_o : STD_LOGIC;
  signal Pmod_out_0_pin2_t : STD_LOGIC;
  signal Pmod_out_0_pin3_i : STD_LOGIC;
  signal Pmod_out_0_pin3_o : STD_LOGIC;
  signal Pmod_out_0_pin3_t : STD_LOGIC;
  signal Pmod_out_0_pin4_i : STD_LOGIC;
  signal Pmod_out_0_pin4_o : STD_LOGIC;
  signal Pmod_out_0_pin4_t : STD_LOGIC;
  signal Pmod_out_0_pin7_i : STD_LOGIC;
  signal Pmod_out_0_pin7_o : STD_LOGIC;
  signal Pmod_out_0_pin7_t : STD_LOGIC;
  signal Pmod_out_0_pin8_i : STD_LOGIC;
  signal Pmod_out_0_pin8_o : STD_LOGIC;
  signal Pmod_out_0_pin8_t : STD_LOGIC;
  signal Pmod_out_0_pin9_i : STD_LOGIC;
  signal Pmod_out_0_pin9_o : STD_LOGIC;
  signal Pmod_out_0_pin9_t : STD_LOGIC;
begin
Pmod_AD2_i: component Pmod_AD2
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      Pmod_out_0_pin10_i => Pmod_out_0_pin10_i,
      Pmod_out_0_pin10_o => Pmod_out_0_pin10_o,
      Pmod_out_0_pin10_t => Pmod_out_0_pin10_t,
      Pmod_out_0_pin1_i => Pmod_out_0_pin1_i,
      Pmod_out_0_pin1_o => Pmod_out_0_pin1_o,
      Pmod_out_0_pin1_t => Pmod_out_0_pin1_t,
      Pmod_out_0_pin2_i => Pmod_out_0_pin2_i,
      Pmod_out_0_pin2_o => Pmod_out_0_pin2_o,
      Pmod_out_0_pin2_t => Pmod_out_0_pin2_t,
      Pmod_out_0_pin3_i => Pmod_out_0_pin3_i,
      Pmod_out_0_pin3_o => Pmod_out_0_pin3_o,
      Pmod_out_0_pin3_t => Pmod_out_0_pin3_t,
      Pmod_out_0_pin4_i => Pmod_out_0_pin4_i,
      Pmod_out_0_pin4_o => Pmod_out_0_pin4_o,
      Pmod_out_0_pin4_t => Pmod_out_0_pin4_t,
      Pmod_out_0_pin7_i => Pmod_out_0_pin7_i,
      Pmod_out_0_pin7_o => Pmod_out_0_pin7_o,
      Pmod_out_0_pin7_t => Pmod_out_0_pin7_t,
      Pmod_out_0_pin8_i => Pmod_out_0_pin8_i,
      Pmod_out_0_pin8_o => Pmod_out_0_pin8_o,
      Pmod_out_0_pin8_t => Pmod_out_0_pin8_t,
      Pmod_out_0_pin9_i => Pmod_out_0_pin9_i,
      Pmod_out_0_pin9_o => Pmod_out_0_pin9_o,
      Pmod_out_0_pin9_t => Pmod_out_0_pin9_t
    );
Pmod_out_0_pin10_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin10_o,
      IO => Pmod_out_0_pin10_io,
      O => Pmod_out_0_pin10_i,
      T => Pmod_out_0_pin10_t
    );
Pmod_out_0_pin1_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin1_o,
      IO => Pmod_out_0_pin1_io,
      O => Pmod_out_0_pin1_i,
      T => Pmod_out_0_pin1_t
    );
Pmod_out_0_pin2_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin2_o,
      IO => Pmod_out_0_pin2_io,
      O => Pmod_out_0_pin2_i,
      T => Pmod_out_0_pin2_t
    );
Pmod_out_0_pin3_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin3_o,
      IO => Pmod_out_0_pin3_io,
      O => Pmod_out_0_pin3_i,
      T => Pmod_out_0_pin3_t
    );
Pmod_out_0_pin4_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin4_o,
      IO => Pmod_out_0_pin4_io,
      O => Pmod_out_0_pin4_i,
      T => Pmod_out_0_pin4_t
    );
Pmod_out_0_pin7_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin7_o,
      IO => Pmod_out_0_pin7_io,
      O => Pmod_out_0_pin7_i,
      T => Pmod_out_0_pin7_t
    );
Pmod_out_0_pin8_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin8_o,
      IO => Pmod_out_0_pin8_io,
      O => Pmod_out_0_pin8_i,
      T => Pmod_out_0_pin8_t
    );
Pmod_out_0_pin9_iobuf: component IOBUF
     port map (
      I => Pmod_out_0_pin9_o,
      IO => Pmod_out_0_pin9_io,
      O => Pmod_out_0_pin9_i,
      T => Pmod_out_0_pin9_t
    );
end STRUCTURE;
