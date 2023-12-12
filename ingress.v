`timescale 1ns/1ps

module ingress (
    input reset_n, clock, 
    input frame_n,valid_n,di, 
    output reg [2:0] address, 
    output reg [31:0] data,
    output reg dataValid
);
    // ingress module to parse incoming serial data into address and data payload
    integer count; 

    // or negedge reset_n
    always @ (posedge clock) begin
        if(!reset_n) begin 
            count = 0;
            dataValid <= 0; 
        end

        if(!frame_n && valid_n) begin 
            if(count <= 2) begin 
                address[count] <= di; 
                count = count + 1; 
            end
        end

        if(!valid_n) begin 
            data[count - 3] <= di; 
            count = count + 1; 
        end

        if(count > 32 && valid_n) begin 
            dataValid <= 1'b1; 
            count = count + 1; 
        end

        if(count == 37) begin 
            dataValid <= 1'b0;
            count = 0;  
        end
    end
endmodule 