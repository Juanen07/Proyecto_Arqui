`timescale 1ns / 1ns

module DataPath_TB;
 
	reg clk = 0;

DataPath dut(.clk(clk));
	
always @* #100 clk <= ~clk;
endmodule


