`timescale 1ns/1ns

module im(
    
	input [31:0] direccion,
    	output reg [31:0] instruccion

);

reg [7:0] im [0:255];

initial
	begin
	$readmemb("instructions.txt", im);
	end

always @*
	begin
	instruccion <= {im[direccion],im[direccion+32'd1],im[direccion+32'd2],im[direccion+32'd3]};
	end

endmodule

/*module im(

input [7:0]direccion,
output  [31:0]instruccion
);

reg [7:0]im[511:0];
wire [31:0]Dir;

initial
	begin

	$readmemb("instructions.txt",im);
	end

assign Dir = {direccion,direccion + 8'd1 , direccion + 8'd2 , direccion + 8'd3};
assign instruccion = im[Dir];


endmodule*/





