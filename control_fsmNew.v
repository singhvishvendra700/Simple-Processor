module control_fsm( input clk, rst, run, input [15:0] IR, 
                    output reg [3:0] select, output [7:0] Rin, output Irin, Ain, Gin, addsub,
                    output reg Done);

parameter [1:0] T0=2'd0, T1=2'd1, T2=2'd2, T3=2'd3;
parameter [1:0] mv=2'd0, mvt=2'd1,add=2'd2, sub=2'd3;
parameter [3:0] sel_r0=4'd0, sel_r1=4'd1, sel_r2=4'd2, sel_r3=4'd3, sel_r4=4'd4, sel_r5=4'd5, sel_r6=4'd6, sel_r7=4'd7, sel_g=4'd8, sel_d=4'd9, sel_dt=4'd10;

wire [1:0] icode;
wire ireg;
wire [2:0] rX, rY;

reg [1:0] tstate, next_state;

assign icode=IR[14:13];
assign ireg=IR[12];
assign rX=IR[11:9];
assign rY=IR[2:0];

always@(posedge clk) begin 
  if(rst) tstate<=0;
  else tstate<=next_state;
end

always@(tstate, run, Ain, Gin, Done) begin
   case(tstate)
     T0: next_state=(run)?T1:T0;
     T1: next_state=(icode[1])?((Ain)?T2:T1):T0;
     T2: next_state=(Gin)?T3:T2;
     T3: next_state=(Done)?T0:T3;
   endcase 
end

always@(tstate, icode)
   case(tstate)
     T0: select=4'bx;
     T1: case(icode)
             mv: select=(ireg)?sel_d:rY;
             mvt:select=sel_dt;
             add:select=rX;
             sub:select=rY;
             default: select=4'bx;
         endcase 

     T2: select=(ireg)?sel_d:rY;
     T3: select=sel_g;
   endcase 


always@(tstate, run, icode) begin 
   case(tstate)
     T0: if(~run) Done=1'b1;
         else Done=1'b0;
     T1: if(icode[1]==1) Done=1'b0;
         else Done=1'b1;
     T2: Done=1'b0;
     T3: Done=1'b1;
   endcase 
end

assign Irin=(tstate == T0)?1'b1:1'b0;
assign Ain=((icode==add || icode==sub) && tstate==T1)? 1'b1:1'b0;
assign Gin=(tstate==T2)? 1'b1:1'b0;
assign addsub=(tstate==T2)?((icode==add)?1'b0:1'b1):1'bx;

Renable R(rX, tstate, icode, Rin);
endmodule 

 
