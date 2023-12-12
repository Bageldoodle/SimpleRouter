`timescale 1ns/1ps

module router( 
    input clock, reset_n, 
    input [7:0] frame_n,valid_n,di, 
    output [7:0] dout,valido_n,frameo_n
);

    wire [2:0] address [7:0];
    wire dataValid [7:0]; 
    wire full [7:0], empty [7:0]; 

    wire [31:0] ingressOut [7:0];     
    wire [31:0] datafifo [7:0];
    //wire [31:0] dataSel [7:0][7:0];
    wire [31:0] dataSel0 [7:0];
    wire [31:0] dataSel1 [7:0];
    wire [31:0] dataSel2 [7:0];
    wire [31:0] dataSel3 [7:0];
    wire [31:0] dataSel4 [7:0];
    wire [31:0] dataSel5 [7:0];
    wire [31:0] dataSel6 [7:0];
    wire [31:0] dataSel7 [7:0];
    //wire [31:0] dataSel0, dataSel1, dataSel2, dataSel3, dataSel4, dataSel5, dataSel6, dataSel7;

    wire pop [7:0];
    //wire push [7:0][7:0];
    wire push0 [7:0];
    wire push1 [7:0];
    wire push2 [7:0];
    wire push3 [7:0];
    wire push4 [7:0];
    wire push5 [7:0];
    wire push6 [7:0];
    wire push7 [7:0]; 

    wire pushe0, pushe1, pushe2, pushe3, pushe4, pushe5, pushe6, pushe7; 

    wire [31:0] fifoIn [7:0]; 
    wire pushfifo [7:0];

    /*
    genvar i, j;
    generate 
        for (i = 0; i < 8; i = i + 1) begin 
            ingress i1 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[i]), .valid_n(valid_n[i]), .di(di[i]), .address(address[i]), .data(ingressOut[i]), .dataValid(dataValid[i])); 
            selector s1 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[i]), .address(address[i]), .datain(ingressOut[i]), .dataout(dataSel[i]), .push(push[i])); 
            fifo3 f1 (.clk(clock), .resetn(reset_n), .din(fifoIn[i]), .push(pushfifo[i]), .pop(pop[i]), .dout(datafifo[i]), .empty(empty[i]), .full(full[i]));
            egress e1 (.datain(datafifo[i]), .empty(empty[i]), .full(full[i]), .clk(clock), .reset_n(reset_n), .push(pushfifo[i]), .dataout(dout[i]), .pop(pop[i]), .frameo_n(frameo_n[i]), .valido_n(valido_n[i]));
        end
        for (i = 0; i < 8; i = i + 1) begin 
            for(j = 0; j < 8; j = j + 1) begin 
                assign fifoIn[j] = dataSel[i][j];
                assign pushfifo[j] = push[i][j];  
            end
        end 
    endgenerate
    */

    
    ingress i0 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[0]), .valid_n(valid_n[0]), .di(di[0]), .address(address[0]), .data(ingressOut[0]), .dataValid(dataValid[0])); 
    ingress i1 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[1]), .valid_n(valid_n[1]), .di(di[1]), .address(address[1]), .data(ingressOut[1]), .dataValid(dataValid[1])); 
    ingress i2 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[2]), .valid_n(valid_n[2]), .di(di[2]), .address(address[2]), .data(ingressOut[2]), .dataValid(dataValid[2])); 
    ingress i3 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[3]), .valid_n(valid_n[3]), .di(di[3]), .address(address[3]), .data(ingressOut[3]), .dataValid(dataValid[3])); 
    ingress i4 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[4]), .valid_n(valid_n[4]), .di(di[4]), .address(address[4]), .data(ingressOut[4]), .dataValid(dataValid[4])); 
    ingress i5 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[5]), .valid_n(valid_n[5]), .di(di[5]), .address(address[5]), .data(ingressOut[5]), .dataValid(dataValid[5])); 
    ingress i6 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[6]), .valid_n(valid_n[6]), .di(di[6]), .address(address[6]), .data(ingressOut[6]), .dataValid(dataValid[6])); 
    ingress i7 (.reset_n(reset_n), .clock(clock), .frame_n(frame_n[7]), .valid_n(valid_n[7]), .di(di[7]), .address(address[7]), .data(ingressOut[7]), .dataValid(dataValid[7])); 
    
    selector s0 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[0]), .address(address[0]), .datain(ingressOut[0]), .dataout(dataSel0), .push(push0));
    selector s1 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[1]), .address(address[1]), .datain(ingressOut[1]), .dataout(dataSel1), .push(push1));
    selector s2 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[2]), .address(address[2]), .datain(ingressOut[2]), .dataout(dataSel2), .push(push2));
    selector s3 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[3]), .address(address[3]), .datain(ingressOut[3]), .dataout(dataSel3), .push(push3));
    selector s4 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[4]), .address(address[4]), .datain(ingressOut[4]), .dataout(dataSel4), .push(push4));
    selector s5 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[5]), .address(address[5]), .datain(ingressOut[5]), .dataout(dataSel5), .push(push5));
    selector s6 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[6]), .address(address[6]), .datain(ingressOut[6]), .dataout(dataSel6), .push(push6));
    selector s7 (.reset_n(reset_n), .clk(clock), .dataValid(dataValid[7]), .address(address[7]), .datain(ingressOut[7]), .dataout(dataSel7), .push(push7));
    
    fifo3 f0 (.clk(clock), .resetn(reset_n), .din({dataSel0[0], dataSel1[0], dataSel2[0], dataSel3[0], dataSel4[0], dataSel5[0], dataSel6[0], dataSel7[0]}), .push({push0[0],push1[0], push2[0], push3[0], push4[0], push5[0], push6[0], push7[0]}), .pop(pop[0]), .dout(datafifo[0]), .empty(empty[0]), .full(full[0]));
    fifo3 f1 (.clk(clock), .resetn(reset_n), .din({dataSel0[1], dataSel1[1], dataSel2[1], dataSel3[1], dataSel4[1], dataSel5[1], dataSel6[1], dataSel7[1]}), .push({push0[1],push1[1], push2[1], push3[1], push4[1], push5[1], push6[1], push7[1]}), .pop(pop[1]), .dout(datafifo[1]), .empty(empty[1]), .full(full[1]));    
    fifo3 f2 (.clk(clock), .resetn(reset_n), .din({dataSel0[2], dataSel1[2], dataSel2[2], dataSel3[2], dataSel4[2], dataSel5[2], dataSel6[2], dataSel7[2]}), .push({push0[2],push1[2], push2[2], push3[2], push4[2], push5[2], push6[2], push7[2]}), .pop(pop[2]), .dout(datafifo[2]), .empty(empty[2]), .full(full[2]));    
    fifo3 f3 (.clk(clock), .resetn(reset_n), .din({dataSel0[3], dataSel1[3], dataSel2[3], dataSel3[3], dataSel4[3], dataSel5[3], dataSel6[3], dataSel7[3]}), .push({push0[3],push1[3], push2[3], push3[3], push4[3], push5[3], push6[3], push7[3]}), .pop(pop[3]), .dout(datafifo[3]), .empty(empty[3]), .full(full[3]));
    fifo3 f4 (.clk(clock), .resetn(reset_n), .din({dataSel0[4], dataSel1[4], dataSel2[4], dataSel3[4], dataSel4[4], dataSel5[4], dataSel6[4], dataSel7[4]}), .push({push0[4],push1[4], push2[4], push3[4], push4[4], push5[4], push6[4], push7[4]}), .pop(pop[4]), .dout(datafifo[4]), .empty(empty[4]), .full(full[4]));
    fifo3 f5 (.clk(clock), .resetn(reset_n), .din({dataSel0[5], dataSel1[5], dataSel2[5], dataSel3[5], dataSel4[5], dataSel5[5], dataSel6[5], dataSel7[5]}), .push({push0[5],push1[5], push2[5], push3[5], push4[5], push5[5], push6[5], push7[5]}), .pop(pop[5]), .dout(datafifo[5]), .empty(empty[5]), .full(full[5]));
    fifo3 f6 (.clk(clock), .resetn(reset_n), .din({dataSel0[6], dataSel1[6], dataSel2[6], dataSel3[6], dataSel4[6], dataSel5[6], dataSel6[6], dataSel7[6]}), .push({push0[6],push1[6], push2[6], push3[6], push4[6], push5[6], push6[6], push7[6]}), .pop(pop[6]), .dout(datafifo[6]), .empty(empty[6]), .full(full[6]));
    fifo3 f7 (.clk(clock), .resetn(reset_n), .din({dataSel0[7], dataSel1[7], dataSel2[7], dataSel3[7], dataSel4[7], dataSel5[7], dataSel6[7], dataSel7[7]}), .push({push0[7],push1[7], push2[7], push3[7], push4[7], push5[7], push6[7], push7[7]}), .pop(pop[7]), .dout(datafifo[7]), .empty(empty[7]), .full(full[7]));

    assign pushe0 = push0[0]|push1[0]|push2[0]|push3[0]|push4[0]|push5[0]|push6[0]|push7[0];
    assign pushe1 = push0[1]|push1[1]|push2[1]|push3[1]|push4[1]|push5[1]|push6[1]|push7[1];
    assign pushe2 = push0[2]|push1[2]|push2[2]|push3[2]|push4[2]|push5[2]|push6[2]|push7[2];
    assign pushe3 = push0[3]|push1[3]|push2[3]|push3[3]|push4[3]|push5[3]|push6[3]|push7[3];
    assign pushe4 = push0[4]|push1[4]|push2[4]|push3[4]|push4[4]|push5[4]|push6[4]|push7[4];
    assign pushe5 = push0[5]|push1[5]|push2[5]|push3[5]|push4[5]|push5[5]|push6[5]|push7[5];
    assign pushe6 = push0[6]|push1[6]|push2[6]|push3[6]|push4[6]|push5[6]|push6[6]|push7[6];
    assign pushe7 = push0[7]|push1[7]|push2[7]|push3[7]|push4[7]|push5[7]|push6[7]|push7[7];

    egress e0 (.datain(datafifo[0]), .empty(empty[0]), .full(full[0]), .clk(clock), .reset_n(reset_n), .push(pushe0), .dataout(dout[0]), .pop(pop[0]), .frameo_n(frameo_n[0]), .valido_n(valido_n[0]));
    egress e1 (.datain(datafifo[1]), .empty(empty[1]), .full(full[1]), .clk(clock), .reset_n(reset_n), .push(pushe1), .dataout(dout[1]), .pop(pop[1]), .frameo_n(frameo_n[1]), .valido_n(valido_n[1]));
    egress e2 (.datain(datafifo[2]), .empty(empty[2]), .full(full[2]), .clk(clock), .reset_n(reset_n), .push(pushe2), .dataout(dout[2]), .pop(pop[2]), .frameo_n(frameo_n[2]), .valido_n(valido_n[2]));
    egress e3 (.datain(datafifo[3]), .empty(empty[3]), .full(full[3]), .clk(clock), .reset_n(reset_n), .push(pushe3), .dataout(dout[3]), .pop(pop[3]), .frameo_n(frameo_n[3]), .valido_n(valido_n[3]));
    egress e4 (.datain(datafifo[4]), .empty(empty[4]), .full(full[4]), .clk(clock), .reset_n(reset_n), .push(pushe4), .dataout(dout[4]), .pop(pop[4]), .frameo_n(frameo_n[4]), .valido_n(valido_n[4]));
    egress e5 (.datain(datafifo[5]), .empty(empty[5]), .full(full[5]), .clk(clock), .reset_n(reset_n), .push(pushe5), .dataout(dout[5]), .pop(pop[5]), .frameo_n(frameo_n[5]), .valido_n(valido_n[5]));
    egress e6 (.datain(datafifo[6]), .empty(empty[6]), .full(full[6]), .clk(clock), .reset_n(reset_n), .push(pushe6), .dataout(dout[6]), .pop(pop[6]), .frameo_n(frameo_n[6]), .valido_n(valido_n[6]));
    egress e7 (.datain(datafifo[7]), .empty(empty[7]), .full(full[7]), .clk(clock), .reset_n(reset_n), .push(pushe7), .dataout(dout[7]), .pop(pop[7]), .frameo_n(frameo_n[7]), .valido_n(valido_n[7]));
    


endmodule