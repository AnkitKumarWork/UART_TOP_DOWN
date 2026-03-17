module CLOCK_DIVIDER(
    input clk,
    input rst, 
    output reg clk_div
);

parameter max_count = 'd50000000;
reg [31:0] count_value;

always @(posedge clk) begin
    if(rst) begin
        count_value <= 0;
        clk_div <=0;
    end
    else if (count_value < max_count) begin
        count_value <= count_value + 1;
    end else begin
        count_value <= 0;
        clk_div <= ~clk_div;
    end
end
endmodule
