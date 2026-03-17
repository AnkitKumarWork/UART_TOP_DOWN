`timescale 1ns / 1ps

module DATAPATH_tb;
    parameter DATA_WIDTH = 8;
    
    reg sys_clk;
    reg sys_rst;
    reg [DATA_WIDTH-1:0] data_in;
    reg rs_en;
    reg bit_enb;
    reg ld_out;
    wire CMP;
    wire TX;
    
    // Instantiate the DATAPATH module
    DATAPATH #(DATA_WIDTH) uut (
        .sys_clk(sys_clk),
        .sys_rst(sys_rst),
        .data_in(data_in),
        .rs_en(rs_en),
        .bit_enb(bit_enb),
        .ld_out(ld_out),
        .CMP(CMP),
        .TX(TX)
    );
    integer i;
    // Clock Generation
    always #5 sys_clk = ~sys_clk; // 10ns clock period
    
    initial begin
        // Initialize signals
        sys_clk = 0;
        sys_rst = 1;
        rs_en = 0;
        bit_enb = 0;
        ld_out = 0;
        data_in = 8'b10101010;
        
        #10 sys_rst = 0; // Release reset
        
        for (i = 0;i<10; i=i+1)begin
            bit_enb = 0;
            rs_en = 0;
            #5;
            bit_enb = 1;
            rs_en = 1;
            ld_out = 1;
            #20;
            
        end
        
        
        #50;
        
        $finish;
    end
    
    // Monitor signals
    initial begin
        $monitor("Time=%0t | rst=%b | rs_en=%b | bit_enb=%b | ld_out=%b | data_in=%b | CMP=%b | TX=%b", 
                 $time, sys_rst, rs_en, bit_enb, ld_out, data_in, CMP, TX);
    end
endmodule