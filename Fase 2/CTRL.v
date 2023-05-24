`timescale 1ns/1ns

module CTRL(

	input [5:0] OpCode,		

	output reg RegDst,
	output reg Jump,
	output reg Branch, 		
	output reg MemRead,		
	output reg MemToReg,		
	output reg [2:0] ALUOp,		
	output reg MemWrite,		
	output reg ALUSrc,		
	output reg RegWrite		
);

always @*
begin
	case (OpCode)

		6'b000000: // tipo R 

			begin
			RegDst   <= 1;
            		Jump     <= 0;
			Branch   <= 0;
			MemRead  <= 0;
			MemToReg <= 1;
			ALUOp    <= 3'b111;
			MemWrite <= 0;
			ALUSrc   <= 0;
			RegWrite <= 1; 
			end

/*
		6'b001000: //Addi

        	begin
        		RegDst = 0;
            		Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b101;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0; 
        	end

        	6'b001010: //slti

        	begin
            		RegDst = 0;
            		Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b100;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end

        	6'b001100://andi

        	begin
            		RegDst = 0;
            		Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b011;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end

        	6'b001101: //ori

        	begin
            		RegDst = 0;
            		Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b010;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end */

        	6'b101011: // Tipo sw

            	begin
            		RegDst   <= 1'dx;
           		Jump     <= 0;
			Branch   <= 0;
			MemToReg <= 1'dx;
			ALUOp    <= 3'b001;
			ALUSrc   <= 1;
			RegWrite <= 0;
			MemWrite <= 1;
			MemRead  <= 0;
        	end

        	6'b100011:// Tipo lw

        	begin
            		RegDst   <= 0;
            		Jump     <= 0;
			Branch   <= 0;
			MemToReg <= 1;
			ALUOp    <= 3'b001;
			ALUSrc   <= 1;
			RegWrite <= 1;
			MemWrite <= 0;
			MemRead  <= 1;
        	end

        	6'b000100:// Tipo beq

        	begin
            		RegDst   <= 1'dx;
            		Jump     <= 0;
			Branch   <= 1;
			MemToReg <= 1'dx;
			ALUOp    <= 3'b000;
			ALUSrc   <= 0;
			RegWrite <= 0;
			MemWrite <= 0; 
			MemRead  <= 0; //antes 1
        	end
/*
        	6'b000010://Jump

        	begin
            		RegDst   = 1'd0;
            		Jump     = 1'd1;
			Branch   = 1'd0;
			MemToReg = 1'd0;
			ALUOp    = 3'dx;
			ALUSrc   = 1'd0;
			RegWrite = 1'd0;
			MemWrite = 1'd0;
			MemRead  = 1'd0;
        	end*/
	endcase
end

endmodule
