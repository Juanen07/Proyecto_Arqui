`timescale 1ns/1ns
module singledata_tb();

reg clk_tb;

singledata duv(
    .clk_tb(clk_tb)
);

initial clk_tb=0;
always #50 clk_tb = ~clk_tb;  // Genera una señal de reloj con un periodo de 10 unidades de tiempo

endmodule

