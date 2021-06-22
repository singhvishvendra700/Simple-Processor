module adder(
    input add_sub,
    input [15:0] A,B,
    output [15:0] out
    );
    
    assign out = (add_sub)?A-B:(~add_sub)?A+B:16'bx;
endmodule
