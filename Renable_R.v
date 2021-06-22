module Renable (
	input [2:0] rin,
	input [1:0] tstate,
	input [1:0] icode,
	output reg [7:0] Rens
	);

	always@(*)
	if( (tstate == 2'd1 && icode[1]!=1'b1) || (tstate == 2'b11))
		case(rin)
			3'b000: Rens = 8'b00000001;
			3'b001: Rens = 8'b00000010;
			3'b010: Rens = 8'b00000100;
			3'b011: Rens = 8'b00001000;
			3'b100: Rens = 8'b00010000;
			3'b101: Rens = 8'b00100000;
			3'b110: Rens = 8'b01000000;
			3'b111: Rens = 8'b10000000;
			default: Rens = 8'd0;
		endcase
    else
        Rens = 8'd0;
endmodule
