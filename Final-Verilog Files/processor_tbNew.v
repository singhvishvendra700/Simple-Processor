module processor_tb();

reg clk;
reg reset;
reg run;
reg [15:0] din;
wire done;
wire [15:0] op;

processor P (.clk(clk), .reset(reset), .run(run), .din(din), .done(done), .op(op));

initial
begin

    clk = 0;
    forever #10 clk = ~clk;

end

task rst;
begin
reset = 1'b1;
#20;
reset = 1'b0;
end
endtask

initial 
begin
    rst;
    din = 16'h1a1f; //000 1 101 000011 111 value copied to r5 register
    run=1;
    #20 run=0;
     
    rst;
    din = 16'h1c0f; //000 1 110 000001 111 value copied to r6 register
    run=1;
    #20 run=0;

    rst;
    din = 16'h4a06; //010 0 101 000000 110 add values of r5 and r6
    run=1;
    #100 run=0;
	 
	 rst;
    din = 16'h1a1f; //000 1 101 000011 111 value copied to r5 register
    run=1;
    #20 run=0;
     
    rst;
    din = 16'h1c0f; //000 1 110 000001 111 value copied to r6 register
    run=1;
    #20 run=0;

    rst;
    din = 16'h6a06; //011 0 101 000000 110 sub value of r6 from r5
    run=1;
    #100 run=0;

end

initial #410 $finish;

endmodule  