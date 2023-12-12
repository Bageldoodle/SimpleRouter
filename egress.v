`timescale 1ns/1ps

module egress (
    input [31:0] datain, 
    input empty, full, clk, reset_n, push,
    output reg dataout, 
    output reg pop,
    output reg frameo_n, valido_n
);
    //egress module which takes data from the FIFO and outputs the data serially on the port. 
    integer i; 

    //or negedge reset_n
    always@(posedge clk) begin 
        if(!reset_n) begin 
            dataout <= 1'bz; 
            i = 0; 
            frameo_n <= 1'b1; 
            valido_n <= 1'b1;
            pop <= 1'b0;  
        end
        if(!empty) begin 
            if(i < 32) begin 
                dataout <= datain[i]; 
                frameo_n <= 1'b0; 
                valido_n <= 1'b0; 
                i = i + 1;
            end
            else begin 
                frameo_n <= 1'b1; 
                valido_n <= 1'b1; 
            end
            if(push) begin 
                pop <= 1'b1; 
            end
            if(pop) begin 
                pop <= 1'b0; 
                i = 0;           
            end
            
        end

    end  

endmodule 