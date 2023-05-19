module alu_control(
    input [5:0] opcode,
    input ALUop,
    output reg [3:0] alu_ctrl
);

always @(*)
begin
    case(opcode)
        6'b000000: // R-type (add, sub, and, or)
            alu_ctrl = 4'b0010;
        6'b001000: // I-type (addi)
            alu_ctrl = 4'b0010;
        6'b110011: // I-type (jalr)
            alu_ctrl = 4'b0010;
        6'b110001: // I-type (auipc)
            alu_ctrl = 4'b0010;
        6'b000100: // I-type (beq)
            alu_ctrl = 4'b0110;
        6'b110111: // U-type (lui)
            alu_ctrl = 4'b0010;
        default:
            alu_ctrl = 4'b0000;
    endcase
end

endmodule

