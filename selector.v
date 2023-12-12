`timescale 1ns/1ps

module selector(
    input reset_n, clk, dataValid,
    input [2:0] address, 
    input [31:0] datain, 
    output reg [31:0] dataout [7:0],
    //output reg [31:0] dataout0, dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7,
    output reg push [7:0]
    //output reg push0, push1, push2, push3, push4, push5, push6, push7
);
    //selector module, essentially a backwards multiplexer, sends data to correct bus based on the address. 
    integer i; 
    //reg flag [7:0]; 
    
    always@(*) begin 
        if(!reset_n) begin 
            for(i = 0; i <= 7; i = i+1) begin 
                dataout[i] <= 32'b0; 
                push[i] <= 1'b0; 
            end
            /*
            dataout0 <= 32'b0;
            push0 <= 1'b0;
            dataout1 <= 32'b0;
            push1 <= 1'b0; 
            dataout2 <= 32'b0;
            push2 <= 1'b0; 
            dataout3 <= 32'b0;
            push3 <= 1'b0; 
            dataout4 <= 32'b0;
            push4 <= 1'b0; 
            dataout5 <= 32'b0;
            push5 <= 1'b0; 
            dataout6 <= 32'b0;
            push6 <= 1'b0; 
            dataout7 <= 32'b0;
            push7 <= 1'b0;  
            */
        end

        if(dataValid) begin 
            case (address)
                0: begin 
                    dataout[0] <= datain; 
                    push[0] <= 1'b1;
                    //dataout0 <= datain; 
                    //push0 <= 1'b1;
                end
                1: begin 
                    dataout[1] <= datain; 
                    push[1] <= 1'b1;
                    //dataout1 <= datain; 
                    //push1 <= 1'b1;
                end
                2: begin 
                    dataout[2] <= datain; 
                    push[2] <= 1'b1;
                    //dataout2 <= datain; 
                    //push2 <= 1'b1; 
                end 
                3: begin 
                    dataout[3] <= datain; 
                    push[3] <= 1'b1;
                    //dataout3 <= datain;
                    //push3 <= 1'b1; 
                end 
                4: begin 
                    dataout[4] <= datain; 
                    push[4] <= 1'b1;
                    //dataout4 <= datain;
                    //push4 <= 1'b1; 
                end
                5: begin 
                    dataout[5] <= datain; 
                    push[5] <= 1'b1;
                    //dataout5 <= datain;
                    //push5 <= 1'b1; 
                end
                6: begin 
                    dataout[6] <= datain; 
                    push[6] <= 1'b1;
                    //dataout6 <= datain;
                    //push6 <= 1'b1; 
                end
                7: begin 
                    dataout[7] <= datain; 
                    push[7] <= 1'b1;
                    //dataout7 <= datain;
                    //push7 <= 1'b1;
                end 
                default: begin 
                    for(i = 0; i <= 7; i = i + 1) begin 
                        dataout[i] <= 32'b0; 
                        push[i] <= 1'b0;
                        /*
                        dataout0 <= 32'b0;
                        push0 <= 1'b0;
                        dataout1 <= 32'b0;
                        push1 <= 1'b0; 
                        dataout2 <= 32'b0;
                        push2 <= 1'b0; 
                        dataout3 <= 32'b0;
                        push3 <= 1'b0; 
                        dataout4 <= 32'b0;
                        push4 <= 1'b0; 
                        dataout5 <= 32'b0;
                        push5 <= 1'b0; 
                        dataout6 <= 32'b0;
                        push6 <= 1'b0; 
                        dataout7 <= 32'b0;
                        push7 <= 1'b0;  
                        */
                    end 
                end
            endcase
        end
        
        else begin 
            for(i = 0; i <= 7; i = i + 1) begin 
                dataout[i] <= 32'b0; 
                push[i] <= 1'b0; 
                /*
                dataout0 <= 32'b0;
                push0 <= 1'b0;
                dataout1 <= 32'b0;
                push1 <= 1'b0; 
                dataout2 <= 32'b0;
                push2 <= 1'b0; 
                dataout3 <= 32'b0;
                push3 <= 1'b0; 
                dataout4 <= 32'b0;
                push4 <= 1'b0; 
                dataout5 <= 32'b0;
                push5 <= 1'b0; 
                dataout6 <= 32'b0;
                push6 <= 1'b0; 
                dataout7 <= 32'b0;
                push7 <= 1'b0;  
                */
            end
        end
        

    end

endmodule