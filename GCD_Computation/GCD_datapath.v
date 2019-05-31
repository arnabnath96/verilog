`include "PIPO.v"
`include "COMP.v"
`include "SUB.v"
`include "MUX.v"

module GCD_datapath(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);
    
    input ldA,ldB,sel1,sel2,sel_in,clk;
    input [15:0] data_in;
    output lt,gt,eq;
    wire [15:0] X,Y,subOut,Aout,Bout,BUS;

    PIPO    A (Aout,BUS,ldA,clk);
    PIPO    B (Bout,BUS,ldB,clk);
    MUX     M1 (X,Aout,Bout,sel1);
    MUX     M2 (Y,Aout,Bout,sel2);
    MUX     M_data (BUS,subOut,data_in,sel_in);
    SUB     S (subOut,X,Y);
    COMP    C (lt,gt,eq,Aout,Bout);

endmodule     