`timescale 1ns/1ns
module data_memory (
    input clk,
    input [31:0] addr,
    input write_data,
    input write_enable,
    output reg [31:0] read_data
);

reg [31:0] mem [0:256];

always @(posedge clk) begin
    if (write_enable)
        mem[addr] <= write_data;
end

assign read_data = mem[addr];

endmodule
