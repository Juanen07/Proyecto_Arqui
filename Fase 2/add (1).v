//adder to increment the PC to the address of the next instruction

`timescale 1ns/1ns

module add(

	input [31:0] in,
	output [31:0] out
	
);

assign out = in + 32'd4;

endmodule
