`timescale 1ns / 1ps

module PISO_REG_tb;
    parameter DATA_WIDTH = 8;
    
    reg clk;
    reg rst;
    reg rs_en;
    reg [DATA_WIDTH-1:0] parallel_in;
    wire serial_out;
    
    // Instantiate the PISO Register
    PISO_REG #(DATA_WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .rs_en(rs_en),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );
    
    // Clock Generation
    always #5 clk = ~clk; // 10ns clock period
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        rs_en = 0;
        parallel_in = 8'b10101010;
        
        #10 rst = 0; // Release reset
        
        #10 rs_en = 1; // Enable shifting
        
        #100;
        
        $finish;
    end
    
    // Monitor signals
    initial begin
        $monitor("Time=%0t | rst=%b | rs_en=%b | parallel_in=%b | serial_out=%b", 
                 $time, rst, rs_en, parallel_in, serial_out);
    end
endmodule
