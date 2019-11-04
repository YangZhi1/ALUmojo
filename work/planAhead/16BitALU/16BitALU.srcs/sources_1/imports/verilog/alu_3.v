/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_3 (
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] aluOut,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder_aluOut;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [6-1:0] M_adder_alufn;
  adder_4 adder (
    .rst(rst),
    .clk(clk),
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .aluOut(M_adder_aluOut),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  wire [16-1:0] M_boolean_aluOut;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_alufn;
  boolean_5 boolean (
    .rst(rst),
    .clk(clk),
    .a(M_boolean_a),
    .b(M_boolean_b),
    .alufn(M_boolean_alufn),
    .aluOut(M_boolean_aluOut)
  );
  wire [16-1:0] M_shifter_aluOut;
  reg [16-1:0] M_shifter_a;
  reg [16-1:0] M_shifter_b;
  reg [6-1:0] M_shifter_alufn;
  shifter_6 shifter (
    .rst(rst),
    .clk(clk),
    .a(M_shifter_a),
    .b(M_shifter_b),
    .alufn(M_shifter_alufn),
    .aluOut(M_shifter_aluOut)
  );
  wire [16-1:0] M_compare_aluOut;
  reg [16-1:0] M_compare_a;
  reg [16-1:0] M_compare_b;
  reg [6-1:0] M_compare_alufn;
  compare_7 compare (
    .rst(rst),
    .clk(clk),
    .a(M_compare_a),
    .b(M_compare_b),
    .alufn(M_compare_alufn),
    .aluOut(M_compare_aluOut)
  );
  
  always @* begin
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = alufn;
    M_boolean_a = a;
    M_boolean_b = b;
    M_boolean_alufn = alufn;
    M_shifter_a = a;
    M_shifter_b = b;
    M_shifter_alufn = alufn;
    M_compare_a = a;
    M_compare_b = b;
    M_compare_alufn = alufn;
    aluOut = 16'h0000;
    
    case (alufn[4+1-:2])
      2'h0: begin
        aluOut = M_adder_aluOut;
      end
      2'h1: begin
        aluOut = M_boolean_aluOut;
      end
      2'h2: begin
        aluOut = M_shifter_aluOut;
      end
      2'h3: begin
        aluOut = M_compare_aluOut;
      end
    endcase
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
  end
endmodule