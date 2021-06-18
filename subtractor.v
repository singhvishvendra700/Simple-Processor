module full_Subtractor(output D, B, input X, Y, Z);

assign D = X ^ Y ^ Z;
assign B = ~X & (Y^Z) | Y & Z;

endmodule 


module half_subtractor(a, b, difference, borrow);

input a, b;
output difference, borrow;
wire x;

xor u1(a, b, difference);
and u2(x, b, borrow);
not u3(a, x);

endmodule 