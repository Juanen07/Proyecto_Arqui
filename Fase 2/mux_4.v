`timescale 1ns/1ns

module mux_4(

	input condition,
	input [31:0] in_0,
	input [31:0] in_1,

	output reg [31:0] mux4_out
);


always @*
begin
	if (condition)

		mux4_out <= in_1;

	else

		mux4_out <= in_0;
end
endmodule
