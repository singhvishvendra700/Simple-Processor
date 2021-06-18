module regm(input clk, en, input [15:0] X, output [15:0] Y);

// Register file storage
reg [15:0] register;

// Read and write from register file
always @(posedge clk) begin
    if (en)
        register <= X;
    else
        Y <= register;
end

endmodule 