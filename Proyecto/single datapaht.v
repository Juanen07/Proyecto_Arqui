`timescale 1ns/1ns
module singledata(
    input clk_tb
);

wire [31:0] C1; // output PC
wire [31:0] C2; //output ADD
wire [31:0] C3; //output instruction_mempry
wire C4; //WD y salida de data_memory
wire [31:0] C5; //op1
wire [31:0] C6; //op2
wire [3:0] C7;  //Alu_ctrl
wire [31:0] C8; //res
wire C9; //Aluop
wire C10; //Mux
wire C11; //Write
wire C12; //Read
wire [31:0]C13; //input Mux
wire C14; //Reg en banco de registros

ADD singleA(
    .a(),
    .b(C1),
    .suma(C2)
);

PC singleB (
    .clk(clk_tb),
    .in(),
    .increment(C2),
    .pc(C1)
);

instruction_memory singleC (
    .address(C1),
    .instruction(C3)
);

bdr bdr_inst (
    .RegEn(C14),
    .RR1(C3[25:21]),
    .RR2(C3[20:16]),
    .WA(C3[15:11]),
    .WD(C4),
    .DR1(C5), 
    .DR2(C6));

ALU ALU_inst (
     .op1(C5),
     .op2(C6),
     .alu_ctrl(C7),
     .res(C8),
     .zf()
);

alu_control alu_control_inst(
      .opcode(C3[5:0]),
      .ALUop(C9),
      .alu_ctrl(C7)
);
data_memory data_inst(
      .clk(),
      .addr(C8),
      .write_data(C11),
      .write_enable(C12),
      .read_data(C13)
);
control_unit control_unit_inst (
      .opcode(C3[31:26]),
      .RegWrite(C10),
      .MemWrite(C11),
      .MemRead(C12),
      .Branch(C14),
      .ALUOp(C9)
);

mux mux_inst(
      .a(C13),
      .b(C8),
      .sel(C10),
      .y(C4)
);

assign instruction = C3;
//assign bdr_inst_addr = C1;
//assign singleC_address = bdr_inst_addr;
//assign instruction = C3;


endmodule
