`timescale 1ns/1ns

module bdr
(
	input RegEn,
	input[6:0]RR1,
	input [6:0]RR2,
	input [6:0]WA,
	input [5:0]WD,
	output reg[31:0]DR1,
	output reg[31:0]DR2
);

reg [31:0] bdr [0:31];
initial
begin
    $readmemb("BR.txt", bdr);
end
always@*
	begin
		if(RegEn)
			begin
				bdr[WA] = WD;
			end
		else
			begin				
				DR1 = bdr[RR1];
				DR2 = bdr[RR2];
			end
	end



endmodule

