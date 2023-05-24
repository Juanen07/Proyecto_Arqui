`timescale 1ns/1ns
module bdr(
	
	input RegWrite, // Habilitación de escritura

	input [4:0] RR1,
	input [4:0] RR2,
	input [4:0] WA, // Direccion del registro
	input [31:0] WD, // Dato a escribir dado WA
	
	output reg [31:0] DR1,
	output reg [31:0] DR2

);


reg [31:0] bdr [0:31]; 

initial
	begin
	bdr [2] = 32'd11;
	bdr [3] = 32'd10; 
	end




always @*
begin
        if(RegWrite)

		begin
                bdr[WA] <= WD;
            	end

        else

            	begin
                DR1 <= bdr[RR1];
                DR2 <= bdr[RR2];
            	end
end
endmodule
