`timescale 1ns/1ns

module add_ALU(

    input [31:0] out_add,
    input [31:0] out_shiftLeft,

    output [31:0] result
);


assign result = out_add + out_shiftLeft;
    
endmodule
