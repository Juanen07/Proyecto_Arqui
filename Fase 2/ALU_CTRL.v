`timescale 1ns/1ns

module ALU_CTRL(

	input [5:0] FunctCode,
	input [2:0] In_ALUOp,

	output reg [2:0] signal
);

always @*
begin
	case (In_ALUOp)// Tipo (R, j, I)

		3'b111: // Tipo R

		case (FunctCode)// R -> Tipo Operacion

			6'b100000: signal <= 3'b000; // +
			6'b100010: signal <= 3'b001; // -
			6'b100100: signal <= 3'b010; // and
			6'b100101: signal <= 3'b011; // or
			6'b101010: signal <= 3'b100; // set less
			6'b000000: signal <= 3'b101; // nop
			default: signal <= 3'b101;   // nop

		endcase

		/*3'b101: out = 3'b000;//addi
                3'b100: out = 3'b101;//slti
                3'b011: out = 3'b100;//andi
                3'b010: out = 3'b011;//ori*/
                3'b001: signal <= 3'b000;//lw y sw
                3'b000: signal <= 3'b001;//beq antes 010

	endcase
end

endmodule

