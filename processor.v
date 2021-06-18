module processor( input[15:0] din, input run, input reset, input clk, input done );

wire [15:0} IR;
wire Irin;
wire [15:0] Buswires;
wire [7:0] Ren;
wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
wire Ain,Gin,addsub;
wire [15:0] aluout;
wire [15:0] Areg,Greg;
wire [3:0] select;

regm IRf(.clk(clk), .X(din), .en(Irin), .Y(IR));

regm R0f(.clk(clk), .X(Buswires), .en(Ren[0]), .Y(R0));
regm R1f(.clk(clk), .X(Buswires), .en(Ren[1]), .Y(R1));
regm R2f(.clk(clk), .X(Buswires), .en(Ren[2]), .Y(R2));
regm R3f(.clk(clk), .X(Buswires), .en(Ren[3]), .Y(R3));
regm R4f(.clk(clk), .X(Buswires), .en(Ren[4]), .Y(R4));
regm R5f(.clk(clk), .X(Buswires), .en(Ren[5]), .Y(R5));
regm R6f(.clk(clk), .X(Buswires), .en(Ren[6]), .Y(R6));
regm R7f(.clk(clk), .X(Buswires), .en(Ren[7]), .Y(R7));

regm Af(.clk(clk), .X(Buswires), .en(Ain), .Y(Areg));
regm Gf(.clk(clk), .X(aluout), .en(Gin), .Y(Greg));

controlfsm CONTROL( .clk(clk), .rst(reset), .run(run), .IR(IR), .select(select), .Rin(Ren), .Irin(Irin), .Ain(Ain), .Gin(Gin), .addsub(addsub), .done(done));

muxlogic MUX(.s1(select), .rr0(R0), .rr1(R1), .rr2(R2), .rr3(R3), .rr4(R4), .rr5(R5), .rr6(R6), .rr7(R7), .IR(IR), .Greg(Greg), .out(out));

adder ALU(.add_sub(addsub), .A(Areg), .B(Buswires), .out(aluout));

endmodule 