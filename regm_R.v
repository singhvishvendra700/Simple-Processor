`timescale 1ns / 1ps

module regm(
        input clk,
        input [15:0] X,
        input en,
        output reg [15:0] Y
        );
        
        always@(posedge clk)
            if(en)
                Y<=X;
endmodule
