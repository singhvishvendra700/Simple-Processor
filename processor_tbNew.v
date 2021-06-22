module processor_tb();

reg clk;
reg reset;
reg run;
reg [15:0] din;
wire done;

processor P (.clk(clk), .reset(reset), .run(run), .din(din), .done(done));

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
    din = 16'h10ff; //000 1 000 011111 111
    run=1;
    #20 run=0;
     
    rst;
    din = 16'h20ff; //001 0 000 011111 111
    run=1;
    #20 run=0;

    rst;
    din = 16'h40ff; //010 0 000 011111 111
    run=1;
    #20 run=0;

    rst;
    din = 16'h60ff; //011 0 000 011111 111
    run=1;
    #20 run=0;

end

initial #150 $finish;

endmodule  