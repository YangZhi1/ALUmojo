/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testALU_3 (
    input clk,
    input rst,
    input [4:0] io_button,
    output reg [15:0] sum,
    input [23:0] io_dip,
    output reg [23:0] sevensegdisp,
    output reg setv,
    output reg setn,
    output reg setz
  );
  
  
  
  localparam START_state = 6'd0;
  localparam ADD1_state = 6'd1;
  localparam ADD2_state = 6'd2;
  localparam ADD3_state = 6'd3;
  localparam ADD4_state = 6'd4;
  localparam SUB1_state = 6'd5;
  localparam SUB2_state = 6'd6;
  localparam AND1_state = 6'd7;
  localparam AND2_state = 6'd8;
  localparam AND3_state = 6'd9;
  localparam OR1_state = 6'd10;
  localparam OR2_state = 6'd11;
  localparam XOR1_state = 6'd12;
  localparam XOR2_state = 6'd13;
  localparam LDR_state = 6'd14;
  localparam SHL1_state = 6'd15;
  localparam SHL2_state = 6'd16;
  localparam SHR1_state = 6'd17;
  localparam SHR2_state = 6'd18;
  localparam SRA1_state = 6'd19;
  localparam SRA2_state = 6'd20;
  localparam CMPEQ_state = 6'd21;
  localparam CMPLT_state = 6'd22;
  localparam CMPLE_state = 6'd23;
  localparam MULT1_state = 6'd24;
  localparam MULT2_state = 6'd25;
  localparam MULT3_state = 6'd26;
  localparam ADD1ERR_state = 6'd27;
  localparam ADD2ERR_state = 6'd28;
  localparam ADD3ERR_state = 6'd29;
  localparam ADD4ERR_state = 6'd30;
  localparam SUB1ERR_state = 6'd31;
  localparam SUB2ERR_state = 6'd32;
  localparam AND1ERR_state = 6'd33;
  localparam AND2ERR_state = 6'd34;
  localparam AND3ERR_state = 6'd35;
  localparam OR1ERR_state = 6'd36;
  localparam OR2ERR_state = 6'd37;
  localparam XOR1ERR_state = 6'd38;
  localparam XOR2ERR_state = 6'd39;
  localparam LDRERR_state = 6'd40;
  localparam SHL1ERR_state = 6'd41;
  localparam SHL2ERR_state = 6'd42;
  localparam SHR1ERR_state = 6'd43;
  localparam SHR2ERR_state = 6'd44;
  localparam SRA1ERR_state = 6'd45;
  localparam SRA2ERR_state = 6'd46;
  localparam CMPEQERR_state = 6'd47;
  localparam CMPLTERR_state = 6'd48;
  localparam CMPLEERR_state = 6'd49;
  localparam MULT1ERR_state = 6'd50;
  localparam MULT2ERR_state = 6'd51;
  localparam MULT3ERR_state = 6'd52;
  localparam FINISH_state = 6'd53;
  
  reg [5:0] M_state_d, M_state_q = START_state;
  wire [16-1:0] M_alu_aluOut;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  reg [1-1:0] M_alu_setz;
  reg [1-1:0] M_alu_setv;
  reg [1-1:0] M_alu_setn;
  alu_7 alu (
    .clk(clk),
    .rst(rst),
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .setz(M_alu_setz),
    .setv(M_alu_setv),
    .setn(M_alu_setn),
    .aluOut(M_alu_aluOut),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  reg [27:0] M_clock_d, M_clock_q = 1'h0;
  
  localparam SPEED = 5'h19;
  
  reg [15:0] wrong;
  
  reg [15:0] atemp;
  
  reg [15:0] btemp;
  
  reg [5:0] alufntemp;
  
  always @* begin
    M_state_d = M_state_q;
    M_clock_d = M_clock_q;
    
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    M_alu_alufn = 6'h00;
    setv = M_alu_v;
    setn = M_alu_n;
    setz = M_alu_z;
    M_alu_setn = 1'h0;
    M_alu_setv = 1'h0;
    M_alu_setz = 1'h0;
    atemp = 16'bxxxxxxxxxxxxxxxx;
    btemp = 16'bxxxxxxxxxxxxxxxx;
    alufntemp = 16'bxxxxxxxxxxxxxxxx;
    sum = M_alu_aluOut;
    sevensegdisp = 24'h000000;
    wrong = 16'h0000;
    if (io_button[1+0-:1] == 1'h1) begin
      wrong = 16'hffff;
    end
    
    case (M_state_q)
      START_state: begin
        sevensegdisp = 24'h5cb4d5;
        M_clock_d = 1'h0;
        if (io_dip[16+0+0-:1] == 1'h1) begin
          sevensegdisp = 24'h2d1515;
          if (io_button[2+0-:1] == 1'h1 && io_dip[16+0+0-:1] == 1'h1) begin
            alufntemp = io_dip[0+0+5-:6];
          end
        end
        if (io_dip[16+1+0-:1] == 1'h1) begin
          sevensegdisp = 24'h2cb2cb;
          if (io_button[2+0-:1] == 1'h1 && io_dip[16+1+0-:1] == 1'h1) begin
            atemp[0+7-:8] = io_dip[0+7-:8];
            atemp[8+7-:8] = io_dip[8+7-:8];
          end
        end
        if (io_dip[16+2+0-:1] == 1'h1) begin
          sevensegdisp = 24'h34d34d;
          if (io_button[2+0-:1] == 1'h1 && io_dip[16+2+0-:1] == 1'h1) begin
            btemp[0+7-:8] = io_dip[0+7-:8];
            btemp[8+7-:8] = io_dip[8+7-:8];
          end
        end
        M_alu_a = atemp;
        M_alu_b = btemp;
        M_alu_alufn = alufntemp;
        sum = M_alu_aluOut;
        setv = M_alu_v;
        setn = M_alu_n;
        setz = M_alu_z;
        if (io_button[3+0-:1] == 1'h1) begin
          M_state_d = ADD1_state;
        end
      end
      ADD1_state: begin
        M_alu_a = 16'h0001 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h00;
        sevensegdisp = 24'h2cc301;
        sum = M_alu_aluOut;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0002) begin
          M_clock_d = 1'h0;
          M_state_d = ADD2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0002) begin
            M_state_d = ADD1ERR_state;
          end
        end
      end
      ADD2_state: begin
        M_alu_a = 16'h8000 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h00;
        sevensegdisp = 24'h2cc302;
        sum = M_alu_aluOut;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h8001 && M_alu_n == 1'h1) begin
          M_clock_d = 1'h0;
          M_state_d = ADD3_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h8001 || M_alu_n != 1'h1) begin
            M_state_d = ADD2ERR_state;
          end
        end
      end
      ADD3_state: begin
        M_alu_a = 16'hffff + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h00;
        sevensegdisp = 24'h2cc303;
        sum = M_alu_aluOut;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000 && M_alu_z == 1'h1) begin
          M_clock_d = 1'h0;
          M_state_d = ADD4_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000 || M_alu_z != 1'h1) begin
            M_state_d = ADD3ERR_state;
          end
        end
      end
      ADD4_state: begin
        M_alu_a = 16'h7fff + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h00;
        sevensegdisp = 24'h2cc304;
        sum = M_alu_aluOut;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h8000 && M_alu_v == 1'h1) begin
          M_clock_d = 1'h0;
          M_state_d = SUB1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h8000 || M_alu_v != 1'h1) begin
            M_state_d = ADD4ERR_state;
          end
        end
      end
      SUB1_state: begin
        M_alu_a = 16'h0035 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h01;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h154341;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0034) begin
          M_clock_d = 1'h0;
          M_state_d = SUB2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0034) begin
            M_state_d = SUB1ERR_state;
          end
        end
      end
      SUB2_state: begin
        M_alu_a = 16'h8001 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h01;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h154342;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h8000 && M_alu_n == 1'h1) begin
          M_clock_d = 1'h0;
          M_state_d = AND1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h8000 || M_alu_n != 1'h1) begin
            M_state_d = SUB2ERR_state;
          end
        end
      end
      AND1_state: begin
        M_alu_a = 16'h0001 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h18;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h2d3301;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = AND2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = AND1ERR_state;
          end
        end
      end
      AND2_state: begin
        M_alu_a = 16'h0000 + wrong;
        M_alu_b = 16'h0000;
        M_alu_alufn = 6'h18;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h2d3302;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = AND3_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = AND2ERR_state;
          end
        end
      end
      AND3_state: begin
        M_alu_a = 16'h0000 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h18;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h2d3303;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = OR1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = AND3ERR_state;
          end
        end
      end
      OR1_state: begin
        M_alu_a = 16'h0001 + wrong;
        M_alu_b = 16'h0000;
        M_alu_alufn = 6'h1e;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h00f055;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = OR2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = OR1ERR_state;
          end
        end
      end
      OR2_state: begin
        M_alu_a = 16'h0000 + wrong;
        M_alu_b = 16'h0000;
        M_alu_alufn = 6'h1e;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h00f095;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = XOR1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = OR2ERR_state;
          end
        end
      end
      XOR1_state: begin
        M_alu_a = 16'h0000 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h16;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h4003c1;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = XOR2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = XOR1ERR_state;
          end
        end
      end
      XOR2_state: begin
        M_alu_a = 16'h0001 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h16;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h4003c2;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = LDR_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = XOR2ERR_state;
          end
        end
      end
      LDR_state: begin
        M_alu_a = 16'h0006 + wrong;
        M_alu_alufn = 6'h1a;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h44c3d5;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0006) begin
          M_clock_d = 1'h0;
          M_state_d = SHL1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0006) begin
            M_state_d = LDRERR_state;
          end
        end
      end
      SHL1_state: begin
        M_alu_a = 16'hffff + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h20;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h152441;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'hfffe) begin
          M_clock_d = 1'h0;
          M_state_d = SHL2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'hfffe) begin
            M_state_d = SHL1ERR_state;
          end
        end
      end
      SHL2_state: begin
        M_alu_a = 16'h000f + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h20;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h152442;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h001e) begin
          M_clock_d = 1'h0;
          M_state_d = SHR1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h001e) begin
            M_state_d = SHL2ERR_state;
          end
        end
      end
      SHR1_state: begin
        M_alu_a = 16'h0007 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h21;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h1523c1;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0003) begin
          M_clock_d = 1'h0;
          M_state_d = SHR2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0003) begin
            M_state_d = SHR1ERR_state;
          end
        end
      end
      SHR2_state: begin
        M_alu_a = 16'hc000 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h21;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h1523c2;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h6000) begin
          M_clock_d = 1'h0;
          M_state_d = SRA1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h6000) begin
            M_state_d = SHR2ERR_state;
          end
        end
      end
      SRA1_state: begin
        M_alu_a = 16'h0007 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h23;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h14f2c1;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0003) begin
          M_clock_d = 1'h0;
          M_state_d = SRA2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0003) begin
            M_state_d = SRA1ERR_state;
          end
        end
      end
      SRA2_state: begin
        M_alu_a = 16'he000 + wrong;
        M_alu_b = 16'h0001;
        M_alu_alufn = 6'h23;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h14f2c2;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'hf000) begin
          M_clock_d = 1'h0;
          M_state_d = CMPEQ_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'hf000) begin
            M_state_d = SRA2ERR_state;
          end
        end
      end
      CMPEQ_state: begin
        M_alu_setz = 16'h0000 + wrong;
        M_alu_alufn = 6'h33;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h28e255;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = CMPLT_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = CMPEQERR_state;
          end
        end
      end
      CMPLT_state: begin
        M_alu_setv = 16'h0001 + wrong;
        M_alu_setn = 16'h0000;
        M_alu_alufn = 6'h35;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h2911d5;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = CMPLE_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = CMPLTERR_state;
          end
        end
      end
      CMPLE_state: begin
        M_alu_setz = 16'h0000 + wrong;
        M_alu_setv = 16'h0001;
        M_alu_setn = 16'h0000;
        M_alu_alufn = 6'h37;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h291595;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = MULT1_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = CMPLEERR_state;
          end
        end
      end
      MULT1_state: begin
        M_alu_a = 16'h0008 + wrong;
        M_alu_b = 16'h0008;
        M_alu_alufn = 6'h02;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h5d4441;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0040) begin
          M_clock_d = 1'h0;
          M_state_d = MULT2_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0004) begin
            M_state_d = MULT1ERR_state;
          end
        end
      end
      MULT2_state: begin
        M_alu_a = 16'h0000 + wrong;
        M_alu_b = 16'h0008;
        M_alu_alufn = 6'h02;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h5d4442;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0000) begin
          M_clock_d = 1'h0;
          M_state_d = MULT3_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0000) begin
            M_state_d = MULT2ERR_state;
          end
        end
      end
      MULT3_state: begin
        M_alu_a = 16'hffff + wrong;
        M_alu_b = 16'hffff;
        M_alu_alufn = 6'h02;
        sum = M_alu_aluOut;
        sevensegdisp = 24'h5d4443;
        M_clock_d = M_clock_q + 1'h1;
        if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut == 16'h0001) begin
          M_clock_d = 1'h0;
          M_state_d = FINISH_state;
        end else begin
          if (M_clock_q[25+0-:1] == 1'h1 && M_alu_aluOut != 16'h0001) begin
            M_state_d = MULT3ERR_state;
          end
        end
      end
      FINISH_state: begin
        sevensegdisp = 24'h393300;
        M_clock_d = M_clock_q + 1'h1;
        if (io_button[4+0-:1] == 1'h1) begin
          M_state_d = START_state;
        end
      end
      ADD1ERR_state: begin
        sevensegdisp = 24'h2cc04e;
      end
      ADD2ERR_state: begin
        sevensegdisp = 24'h2cc08e;
      end
      ADD3ERR_state: begin
        sevensegdisp = 24'h2cc0ce;
      end
      ADD4ERR_state: begin
        sevensegdisp = 24'h2cc10e;
      end
      SUB1ERR_state: begin
        sevensegdisp = 24'h50d04e;
      end
      SUB2ERR_state: begin
        sevensegdisp = 24'h50d08e;
      end
      AND1ERR_state: begin
        sevensegdisp = 24'h2d304e;
      end
      AND2ERR_state: begin
        sevensegdisp = 24'h2d308e;
      end
      AND3ERR_state: begin
        sevensegdisp = 24'h2d30ce;
      end
      OR1ERR_state: begin
        sevensegdisp = 24'h00f04e;
      end
      OR2ERR_state: begin
        sevensegdisp = 24'h00f08e;
      end
      XOR1ERR_state: begin
        sevensegdisp = 24'h40f04e;
      end
      XOR2ERR_state: begin
        sevensegdisp = 24'h40f08e;
      end
      LDRERR_state: begin
        sevensegdisp = 24'h44c3ce;
      end
      SHL1ERR_state: begin
        sevensegdisp = 24'h49104e;
      end
      SHL2ERR_state: begin
        sevensegdisp = 24'h49108e;
      end
      SHR1ERR_state: begin
        sevensegdisp = 24'h48f04e;
      end
      SHR2ERR_state: begin
        sevensegdisp = 24'h48f08e;
      end
      SRA1ERR_state: begin
        sevensegdisp = 24'h3cb04e;
      end
      SRA2ERR_state: begin
        sevensegdisp = 24'h3cb08e;
      end
      CMPEQERR_state: begin
        sevensegdisp = 24'h29758e;
      end
      CMPLTERR_state: begin
        sevensegdisp = 24'h29744e;
      end
      CMPLEERR_state: begin
        sevensegdisp = 24'h29158e;
      end
      MULT1ERR_state: begin
        sevensegdisp = 24'h5d104e;
      end
      MULT2ERR_state: begin
        sevensegdisp = 24'h5d108e;
      end
      MULT3ERR_state: begin
        sevensegdisp = 24'h5d10ce;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_clock_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_clock_q <= M_clock_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
