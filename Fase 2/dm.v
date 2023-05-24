`timescale 1ns/1ns 

module dm(

	input MemWrite,             // CTRL : Habilitar escritura
	input [31:0] Address,               // ALU : Direccion
	input [31:0] WriteData,      // bdr : Dato a escribir
	input MemRead,              // CTRL : Habilitar lectura
	output reg [31:0] ReadData  // Dato salida a leer

	//input [31:0] Din, // dato entrada : writeData
	//input [31:0] Dir, // Direccion 
	//output reg [31:0] Dout // datosalida : readData
);

reg [31:0] dm [0:127];

/*initial
begin
	memoria [0] = 32'd67;
	memoria [1] = 32'd101;
	memoria [2] = 32'd115;
	memoria [3] = 32'd97;
	memoria [4] = 32'd114;
	memoria [5] = 32'd32;
	memoria [6] = 32'd71;
	memoria [7] = 32'd111;
	memoria [8] = 32'd110;
	memoria [9] = 32'd122;
	memoria [10] = 32'd97;
	memoria [11] = 32'd108;
	memoria [12] = 32'd101;
	memoria [13] = 32'd122;
end*/

always @* 
begin
	if(MemWrite)

    		begin
        	dm[Address] <= WriteData; // escribir
    		end

    	else if(MemRead)

    		begin
        	ReadData <= dm[Address]; // leer
    		end

    	else

    		begin
        	ReadData <= 32'dx; // lectura = x
		end
end

endmodule
