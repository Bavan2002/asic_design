// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 24 16:28:13 2026
// Host        : fedora running 64-bit unknown
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/eren/Downloads/lab1_ece528/lab1/lab1.sim/sim_1/synth/func/xsim/lab_tb_func_synth.v
// Design      : lab
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* IDLE = "2'b00" *) (* ST0 = "2'b01" *) (* ST1 = "2'b11" *) 
(* NotValidForBitStream *)
module lab
   (clk,
    reset,
    countup,
    SSG_D,
    SSG_EN);
  input clk;
  input reset;
  input countup;
  output [6:0]SSG_D;
  output [2:0]SSG_EN;

  wire \FSM_onehot_c_state[0]_i_1_n_0 ;
  wire \FSM_onehot_c_state[1]_i_1_n_0 ;
  wire \FSM_onehot_c_state[2]_i_1_n_0 ;
  wire \FSM_onehot_c_state_reg_n_0_[0] ;
  wire \FSM_onehot_c_state_reg_n_0_[1] ;
  wire [6:0]SSG_D;
  wire [6:0]SSG_D_OBUF;
  wire [2:0]SSG_EN;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cnt_enable;
  wire [3:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire countup;
  wire countup_IBUF;
  wire reset;
  wire reset_IBUF;

  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_c_state[0]_i_1 
       (.I0(cnt_enable),
        .I1(countup_IBUF),
        .I2(\FSM_onehot_c_state_reg_n_0_[0] ),
        .O(\FSM_onehot_c_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    \FSM_onehot_c_state[1]_i_1 
       (.I0(\FSM_onehot_c_state_reg_n_0_[0] ),
        .I1(countup_IBUF),
        .I2(\FSM_onehot_c_state_reg_n_0_[1] ),
        .O(\FSM_onehot_c_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_c_state[2]_i_1 
       (.I0(\FSM_onehot_c_state_reg_n_0_[1] ),
        .I1(countup_IBUF),
        .O(\FSM_onehot_c_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:001,ST0:010,ST1:100" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_c_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_c_state[0]_i_1_n_0 ),
        .PRE(reset_IBUF),
        .Q(\FSM_onehot_c_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDLE:001,ST0:010,ST1:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_c_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "IDLE:001,ST0:010,ST1:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_c_state[2]_i_1_n_0 ),
        .Q(cnt_enable));
  OBUF \SSG_D_OBUF[0]_inst 
       (.I(SSG_D_OBUF[0]),
        .O(SSG_D[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAA9C)) 
    \SSG_D_OBUF[0]_inst_i_1 
       (.I0(count[3]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .O(SSG_D_OBUF[0]));
  OBUF \SSG_D_OBUF[1]_inst 
       (.I(SSG_D_OBUF[1]),
        .O(SSG_D[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hACE8)) 
    \SSG_D_OBUF[1]_inst_i_1 
       (.I0(count[3]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(count[0]),
        .O(SSG_D_OBUF[1]));
  OBUF \SSG_D_OBUF[2]_inst 
       (.I(SSG_D_OBUF[2]),
        .O(SSG_D[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hAAB0)) 
    \SSG_D_OBUF[2]_inst_i_1 
       (.I0(count[3]),
        .I1(count[0]),
        .I2(count[1]),
        .I3(count[2]),
        .O(SSG_D_OBUF[2]));
  OBUF \SSG_D_OBUF[3]_inst 
       (.I(SSG_D_OBUF[3]),
        .O(SSG_D[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hEA9C)) 
    \SSG_D_OBUF[3]_inst_i_1 
       (.I0(count[3]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .O(SSG_D_OBUF[3]));
  OBUF \SSG_D_OBUF[4]_inst 
       (.I(SSG_D_OBUF[4]),
        .O(SSG_D[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFB8)) 
    \SSG_D_OBUF[4]_inst_i_1 
       (.I0(count[3]),
        .I1(count[1]),
        .I2(count[2]),
        .I3(count[0]),
        .O(SSG_D_OBUF[4]));
  OBUF \SSG_D_OBUF[5]_inst 
       (.I(SSG_D_OBUF[5]),
        .O(SSG_D[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF9B8)) 
    \SSG_D_OBUF[5]_inst_i_1 
       (.I0(count[3]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(count[0]),
        .O(SSG_D_OBUF[5]));
  OBUF \SSG_D_OBUF[6]_inst 
       (.I(SSG_D_OBUF[6]),
        .O(SSG_D[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hEAA5)) 
    \SSG_D_OBUF[6]_inst_i_1 
       (.I0(count[3]),
        .I1(count[0]),
        .I2(count[2]),
        .I3(count[1]),
        .O(SSG_D_OBUF[6]));
  OBUF \SSG_EN_OBUF[0]_inst 
       (.I(1'b1),
        .O(SSG_EN[0]));
  OBUF \SSG_EN_OBUF[1]_inst 
       (.I(1'b1),
        .O(SSG_EN[1]));
  OBUF \SSG_EN_OBUF[2]_inst 
       (.I(1'b1),
        .O(SSG_EN[2]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \count[1]_i_1 
       (.I0(count[2]),
        .I1(count[3]),
        .I2(count[0]),
        .I3(count[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(count[2]),
        .I1(count[0]),
        .I2(count[1]),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6C8C)) 
    \count[3]_i_1 
       (.I0(count[2]),
        .I1(count[3]),
        .I2(count[0]),
        .I3(count[1]),
        .O(\count[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_enable),
        .CLR(reset_IBUF),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_enable),
        .CLR(reset_IBUF),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_enable),
        .CLR(reset_IBUF),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_enable),
        .CLR(reset_IBUF),
        .D(\count[3]_i_1_n_0 ),
        .Q(count[3]));
  IBUF countup_IBUF_inst
       (.I(countup),
        .O(countup_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
