`timescale 1ns/1ns

module mux_5(

	input condition,
	input [31:0] in_0,
	input [31:0] in_1,

	output reg [31:0] mux5_out
);


always @*
begin
	if (condition)

		mux5_out <= in_0;

	else

		mux5_out <= in_1;
end
endmodule
