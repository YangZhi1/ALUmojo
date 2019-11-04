/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [24-1:0] M_testALU_io_led;
  wire [28-1:0] M_testALU_sevensegdisp;
  reg [5-1:0] M_testALU_io_button;
  reg [24-1:0] M_testALU_io_dip;
  testALU_2 testALU (
    .clk(clk),
    .rst(rst),
    .io_button(M_testALU_io_button),
    .io_dip(M_testALU_io_dip),
    .io_led(M_testALU_io_led),
    .sevensegdisp(M_testALU_sevensegdisp)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_testALU_io_button = io_button;
    M_testALU_io_dip = io_dip;
    io_led = M_testALU_io_led;
  end
endmodule
