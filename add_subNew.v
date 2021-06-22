module fullAdder_neww (input a0,a1,carry_in, output s,carry_out);

    assign s = (a0 ^ a1) ^ carry_in;
    assign carry_out = (a0 & a1 & carry_in)|(a0 & a1 & ~carry_in)|(a0 & ~a1 & carry_in)|(~a0 & a1 & carry_in);

endmodule

module adder(enable,a0, a1,cout);

    input enable;
    input  [15:0] a0, a1;
    output [15:0] cout;
    
    wire c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r;
    wire input0,input1, input2, input3, input4, input5, input6, input7, input8, input9, input10,input11, input12, input13, input14, input15;

    xor(input0, enable, a1[0]);
    xor(input1, enable, a1[1]);
    xor(input2, enable, a1[2]);
    xor(input3, enable, a1[3]);
    xor(input4, enable, a1[4]);
    xor(input5, enable, a1[5]);
    xor(input6, enable, a1[6]);
    xor(input7, enable, a1[7]);
    xor(input8, enable, a1[8]);
    xor(input9, enable, a1[9]);
    xor(input10, enable, a1[10]);
    xor(input11, enable, a1[11]);
    xor(input12, enable, a1[12]);
    xor(input13, enable, a1[13]);
    xor(input14, enable, a1[14]);
    xor(input15, enable, a1[15]);

    
    //a0,a1,carry_in,s,carry_out    
    fullAdder_neww fa0(a0[0],input0,enable,cout[0],c);
    fullAdder_neww fa1(a0[1],input1,c,cout[1],d);
    fullAdder_neww fa2(a0[2],input2,d,cout[2],e);
    fullAdder_neww fa3(a0[3],input3,e,cout[3],f);
    fullAdder_neww fa4(a0[4],input4,f,cout[4],g);
    fullAdder_neww fa5(a0[5],input5,g,cout[5],h);
    fullAdder_neww fa6(a0[6],input6,h,cout[6],i);
    fullAdder_neww fa7(a0[7],input7,i,cout[7],j);
    fullAdder_neww fa8(a0[8],input8,j,cout[8],k);
    fullAdder_neww fa9(a0[9],input9,k,cout[9],l);
    fullAdder_neww fa10(a0[10],input10,l,cout[10],m);
    fullAdder_neww fa11(a0[11],input11,m,cout[11],n);
    fullAdder_neww fa12(a0[12],input12,n,cout[12],o);
    fullAdder_neww fa13(a0[13],input13,o,cout[13],p);
    fullAdder_neww fa14(a0[14],input14,p,cout[14],q);
    fullAdder_neww fa15(a0[15],input15,q,cout[15],r);


endmodule 