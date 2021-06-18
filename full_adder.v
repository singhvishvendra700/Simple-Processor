module full_adder (a, b, cin, cout, sum);

input a, b, cin;
output sum, cout;
wire w1, w2, w3;

half_adder ha1(.a(a), .b(b), .sum(w1), .carry(w2));
half_adder ha2(.a(w1), .b(cin), .sum(sum), .carry(w3));

assign cout = w2|w3;

endmodule 