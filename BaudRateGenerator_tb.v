`timescale 1ns/1ps

module BaudRateGenerator_tb;
    parameter CLOCK_RATE = 1000000; // 1MHz clock
    parameter BAUD_RATE = 9600;

    reg clk;
    wire rxClk, txClk;

    // Instantiate the module under test
    BaudRateGenerator #(
        .CLOCK_RATE(CLOCK_RATE),
        .BAUD_RATE(BAUD_RATE)
    ) uut (
        .clk(clk),
        .rxClk(rxClk),
        .txClk(txClk)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #500 clk = ~clk; // 1MHz clock (T = 1000ns -> 500ns per edge)
    end

    // Monitor outputs
    initial begin
        $monitor($time, " clk=%b, rxClk=%b, txClk=%b", clk, rxClk, txClk);
    end

    // Run simulation for a certain period
    initial begin
        #10000000; // Simulate for 10ms
        $finish;
    end
endmodule
