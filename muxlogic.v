//MUXLOGIC

module mux_logic( input [3:0] s1, input [15:0] rr0,rr1,rr2,rr3,rr4,rr5,rr6,rr7,IR,Greg,
                  output reg [15:0] out);

parameter [3:0] sel_r0=4'd0, sel_r1=4'd1, sel_r2=4'd2, sel_r3=4'd3, sel_r4=4'd4, sel_r5=4'd5, sel_r6=4'd6, sel_r7=4'd7, sel_g=4'd8, sel_d=4'd9, sel_dt=4'd10;


always@(s1) 
      case(s1)
         sel_r0: out=rr0;
         sel_r1: out=rr1;
         sel_r2: out=rr2;
         sel_r3: out=rr3;
         sel_r4: out=rr4;
         sel_r5: out=rr5;
         sel_r6: out=rr6;
         sel_r7: out=rr7;
         sel_d : out={{7(1'b0)},IR[8:0]};
         sel_dt: out={IR[7:0],{8(1'b0)}};
         sel_g: out=Greg; 
         default: out=16'bxxxxxxxxxxxxxxxx;
       endcase
endmodule 
                     