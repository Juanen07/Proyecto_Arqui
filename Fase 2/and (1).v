`timescale 1ns/1ns
module And(

    input Branch,
    input ZeroFlag,

    output out_and
);

assign out_and = Branch & ZeroFlag;

endmodule
