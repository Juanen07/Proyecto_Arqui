`timescale 1ns/1ns
module PC(
    input clk,
    input in,
    input [31:0] increment,
    output reg [31:0] pc
);

// Inicializar PC en 0 al comienzo
initial begin
    pc = 32'h00000000;
end

// Incrementar PC cuando se recibe una se�al de reloj (clk) y la se�al de reset (rst) est� desactivada
always @(posedge clk) begin
    if (!in) begin
        pc <= 32'h00000000;
    end else begin
        pc <= pc + increment;
    end
end

endmodule

