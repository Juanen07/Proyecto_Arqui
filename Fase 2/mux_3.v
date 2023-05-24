`timescale 1ns/1ns

module mux_3(

	input condition,
	input [31:0] in_0,
	input [31:0] in_1,

	output reg [31:0] mux3_out
);


always @*
begin
	if (condition)

		mux3_out <= in_0;

	else

		mux3_out <= in_1;
end
endmodule
