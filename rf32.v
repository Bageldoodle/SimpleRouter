`timescale 1ns/1ps

module rf32 (ra, wa, wen, din, clk, dout);

input [3:0] ra, wa;
input wen;
input [31:0] din;
input clk;
output reg [31:0] dout;


reg [31:0] r [15:0];
wire [15:0] y;
integer i;

assign y[0] = (wa == 4'b0000) && wen;
assign y[1] = (wa == 4'b0001) && wen;
assign y[2] = (wa == 4'b0010) && wen;
assign y[3] = (wa == 4'b0011) && wen;
assign y[4] = (wa == 4'b0100) && wen;
assign y[5] = (wa == 4'b0101) && wen;
assign y[6] = (wa == 4'b0110) && wen;
assign y[7] = (wa == 4'b0111) && wen;
assign y[8] = (wa == 4'b1000) && wen;
assign y[9] = (wa == 4'b1001) && wen;
assign y[10] = (wa == 4'b1010) && wen;
assign y[11] = (wa == 4'b1011) && wen;
assign y[12] = (wa == 4'b1100) && wen;
assign y[13] = (wa == 4'b1101) && wen;
assign y[14] = (wa == 4'b1110) && wen;
assign y[15] = (wa == 4'b1111) && wen;



always @(posedge clk) begin
  for (i=0; i<16; i=i+1) 
    if (y[i]) r[i]<=din;
end

always @(*)
  begin
  dout <= r[ra];
  end


endmodule
