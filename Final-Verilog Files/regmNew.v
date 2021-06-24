/*module regm(input clk, en, input [15:0]X, output [15:0]Y);

// Register file storage
reg [15:0] register;

// Read and write from register file
always @(posedge clk) begin
    if (en)
        register <= X;
    else
        Y <= register;
end

endmodule */

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


/*module regm(input clk,en, input X, output Y);
wire mux_out;
mux m1(mux_out, en, Y, X);
dff d1(Y, clk, mux_out);
endmodule

module mux(out, sel, a, b);
input sel, a, b;
output out;
wire w;
notg not_gate(w, sel);
pmos p1(out, b, w);
nmos n1(out, b, sel);
pmos p2(out, a, sel);
nmos n2(out, a, w);
endmodule

module notg(out, in);
input in;
output out;
wire vdd, gnd;
assign vdd = 1'b1;
assign gnd = 1'b0;
pmos p1(out, vdd, in);
nmos n1(out, gnd, in);
endmodule

module dff(out, clk, in);
input clk, in;
output out;
wire p, o, w_not, q, q_bar;
nand n11(p, in, clk);
nand n12(o, clk, w_not);
nand n21(q, p, q_bar);
nand n22(q_bar, o, q);
not not1(w_not, in);
assign out = q;
endmodule*/
