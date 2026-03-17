module PISO_REG #(parameter DATA_WIDTH = 8)(
    input  clk,
    input  rst,
    input  rs_en,
    input  [DATA_WIDTH-1:0] data_in,
    output reg serial_out
);
    localparam piso_width = DATA_WIDTH + 2; // 8-bit data + 1 start bit + 1 stop bit

    reg [piso_width-1:0] piso_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            piso_reg <= {1'b1, data_in, 1'b0}; // Start bit = 0, Stop bit = 1
            serial_out <= 1'b1; // Idle state
        end
        else if (rs_en) begin
            serial_out <= piso_reg[0]; // Send out LSB first
            piso_reg <= piso_reg >> 1; // Shift right
        end
    end

endmodule
