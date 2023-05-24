`timescale 1ns/1ns

module mux_1(

	input condition,
	input [4:0] in_0,
	input [4:0] in_1,

	output reg [4:0] mux1_out
);

always @*
begin
	if (condition)

		mux1_out <= in_1;
	else
		mux1_out <= in_0;
end

endmodule
