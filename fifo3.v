`timescale 1ns/1ps

module fifo3(clk, resetn, din, push, pop, dout, empty, full);
//FIFO module with 8-input bus, each bus is 32 bits, takes data from valid bus and stores it in register files
input clk;
input resetn;
input [31:0] din [7:0];
input push [7:0]; 
input pop;
output [31:0] dout;
output reg empty;
output full;

reg [3:0] head, tail;
reg [3:0] count; 
wire we;

wire pushreg; 
integer i; 
wire [31:0] datareg; 

rf32 m_rf32(tail, head, we, datareg, clk, dout);


always @(posedge clk) begin
  if (resetn == 0) begin
    head <= 0;
    tail <= 0;
    empty <= 1;
    i <= 0; 
  end
  else begin
    if(!full & pushreg) begin
      head <= head + 1;
      empty <= 0;   
    end 
    if (!empty & pop) begin
      tail <= tail + 1;
        if ((tail + 1 == head)) empty <= 1;
    end
  end
end

assign pushreg = push[0] | push[1] | push[2] | push[3] | push[4] | push[5] |  push[6] | push[7];
assign datareg = din[0] | din [1] | din[2] | din[3] | din[4] | din[5] | din[6] | din[7];
assign full = ((head == tail) & !empty);
assign we = (!full & pushreg);
endmodule
