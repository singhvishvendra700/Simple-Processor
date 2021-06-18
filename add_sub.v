module adder(add_sub, A, B, out);
parameter N=16;
input [N-1:0] A, B;
input add_sub;
output [N-1:0] out;
//wire  carry_out;
wire [N-1:0] carry;
reg enable;

always@(add_sub)begin 
enable <= add_sub;
end

   genvar i;
   generate 
//for addition
   if(enable) begin
   for(i=0;i<N;i=i+1)
   if(i==0) 
  half_adder f(A[0],B[0],out[0],carry[0]);
   else
  full_adder f(A[i],B[i],carry[i-1],out[i],carry[i]);
     end //end if statement
//assign carry_out = carry[N-1];

//for subtraction
   else begin 
   for(i=0;i<N;i=i+1)
   if(i==0) 
  half_subtractor f(A[0],B[0],out[0],carry[0]);
   else
  full_subtractor f(A[i],B[i],carry[i-1],out[i], carry[i]);
   end //end else statement
   endgenerate
endmodule 