`timescale 1ns/1ps
module BIT_COUNTER(
    input clk,
    input rst,
    input bit_enb,
    output [3:0] bit_index
);

reg [3:0] count_value;

always@(posedge clk or posedge rst)
begin
  if(rst )
        count_value <= 0;
    else
        if(bit_enb)
            count_value <= count_value + 1;
end
assign bit_index = count_value;
endmodule