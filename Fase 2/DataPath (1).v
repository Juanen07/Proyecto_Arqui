`timescale 1ns / 1ns

module DataPath(

	input clk

);

wire [31:0] C1; //entrada de suma y salida de pc 
wire [31:0] C2; // salida de add
wire [31:0] C3; // salida de im
wire C4; // reg write
wire [31:0] C5; // salida de bdr y entrada de alu
wire [31:0] C6; // salida de bdr y entrada de alu
wire C7; //ALUSrc 
wire [31:0] C8; //op2
wire [31:0] C9;  //salida de sign extend
wire C10; // RegDst
wire [4:0] C11;
wire C12; //MemWrite
wire [31:0]C13; //Salida ALU
wire [2:0]C14; //AluOp
wire [2:0]C15; //signal
wire C16; //MemtoReg
wire [31:0]C17; //ReadData
wire [31:0]C18; //WD
wire C19;  //Branch
wire C20;  //Zero 
wire C21;  //out_And
wire [31:0]C22; //salida shift left2 y entrada alu
wire [31:0]C23; //ALU result
wire C24; //Jump
wire [31:0]C26; //In de pc
wire C25; //Memread

add ins1(
.in(C1),
.out(C2)
);

pc ins2(
.clk(),
.in_pc(C26),
.out_pc(C1)
);

im ins3(
.direccion(C1),
.instruccion(C3)
);

CTRL ins4(
.OpCode(C3[31:26]),		
.RegDst(C10),
.Jump(C24),
.Branch(C19), 		
.MemRead(C25),		
.MemToReg(C16),		
.ALUOp(C14),		
.MemWrite(C12),		
.ALUSrc(C7),		
.RegWrite(C4)	

);

bdr ins5(
.RegWrite(C4),
.RR1(C3[25:21]),
.RR2(C3[20:16]),
.WA(C11), // Direccion del registro
.WD(C18), // Dato a escribir dado WA
	
.DR1(C5),
.DR2(C6)

);

ALU ins6(
.op1(C5),
.op2(C8),
.in_signal(C15),
.ALUresult(C13),
.Zero(C20)
);


mux_2 ins7(
.condition(C7),
.in_0(C6),
.in_1(C9),
.mux2_out(C8)
);

sign_extend ins8(
.in(C3[15:0]),
.out(C9)
);

mux_1 ins9(
.condition(C10),
.in_0(C3[20:16]),
.in_1(C3[15:11]),
.mux1_out(C11)

);

dm ins10(
.MemWrite(C12),
.Address(C13),
.WriteData(C6),
.MemRead(C25),
.ReadData(C17) 

);

ALU_CTRL ins11(
.FunctCode(C3[5:0]),
.In_ALUOp(C14),
.signal(C15)
);

mux_3 ins12(
.condition(C16),
.in_0(C17),
.in_1(C13),
.mux3_out(C18)

);

And ins13(
.Branch(C19),
.ZeroFlag(C20),

.out_and(C21)

);

mux_4 ins14(
.condition(C21),
.in_0(C2),
.in_1(C23),
.mux4_out(C18)

);

shiftLeft2 ins15(
.in(C9),
.out(C22)
);

add_ALU ins16(
.out_add(C2),
.out_shiftLeft(C22),

.result(C23)
);

mux_5 inst17(
.condition(C24),
.in_0(C23),
.in_1(C22),
.mux5_out(C26)
);

shiftLeft02 ins18(
.in(C3[25:0]),
.out(C2)
);
endmodule

 












