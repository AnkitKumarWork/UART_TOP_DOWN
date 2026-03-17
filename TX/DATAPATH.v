`timescale 1ns/1ps
module DATAPATH #(DATA_WIDTH = 8)(
    input sys_clk,
    input sys_rst,
    input [DATA_WIDTH-1:0] data_in,
    input rs_en,
    input bit_enb,
    input ld_out,
    output CMP,
    output TX
);

wire serial_out;
wire [3:0] bit_index;

PISO_REG #(.DATA_WIDTH(DATA_WIDTH)) piso_reg(
    .clk(sys_clk),
    .rst(sys_rst),
    .rs_en(rs_en),
    .data_in(data_in),
    .serial_out(serial_out)
);
Reg_out reg_out(
    .clk(sys_clk),
    .rst(sys_rst),
    .serial_in(serial_out),
    .ld_out(ld_out),
    .TX(TX)
);

BIT_COUNTER bit_counter(
    .clk(sys_clk),
    .rst(sys_rst),
    .bit_enb(bit_enb),
    .bit_index(bit_index)
);
COMPARATOR comparator(
    .bit_index(bit_index),
    .CMP(CMP)
);


endmodule