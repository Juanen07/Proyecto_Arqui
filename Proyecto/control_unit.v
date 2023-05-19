module control_unit(
    input [6:0] opcode,
    output reg RegWrite,
    output reg MemWrite,
    output reg MemRead,
    output reg Branch,
    output reg ALUOp
);

always @(*)
begin
    case(opcode)
        6'b000000: // R-type
            begin
                RegWrite = 1;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                ALUOp = 2'b10;
            end
        6'b001000: // ADDI
            begin
                RegWrite = 1;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                ALUOp = 2'b00;
            end
        6'b100011: // LW
            begin
                RegWrite = 1;
                MemWrite = 0;
                MemRead = 1;
                Branch = 0;
                ALUOp = 2'b00;
            end
        6'b101011: // SW
            begin
                RegWrite = 0;
                MemWrite = 1;
                MemRead = 0;
                Branch = 0;
                ALUOp = 2'b00;
            end
        6'b000100: // BEQ
            begin
                RegWrite = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                ALUOp = 2'b01;
            end
        default: // Invalid opcode
            begin
                RegWrite = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                ALUOp = 2'b00;
            end
    endcase
end

endmodule



