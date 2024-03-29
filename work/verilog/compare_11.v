/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_11 (
    input [5:0] alufn,
    output reg [15:0] aluOut,
    input z,
    input v,
    input n
  );
  
  
  
  always @* begin
    aluOut = 16'h0000;
    
    case (alufn[1+1-:2])
      2'h1: begin
        aluOut[0+0-:1] = z;
      end
      2'h2: begin
        aluOut[0+0-:1] = n ^ v;
      end
      2'h3: begin
        aluOut[0+0-:1] = z | (n ^ v);
      end
      default: begin
        aluOut[0+0-:1] = 1'h0;
      end
    endcase
  end
endmodule
