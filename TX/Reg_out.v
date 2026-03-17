`timescale 1ns/1ps
module Reg_out(
    input clk, 
    input rst,
    input serial_in,
    input ld_out,
    output TX
    );

reg temp_out;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        temp_out <= 1'd0; // Reset temp_out to 0
    end else if (ld_out) begin
        temp_out <= serial_in; // Load new value when ld_out is asserted
    end
end

// Continuous assignment for sum_out
assign TX = temp_out;
endmodule
