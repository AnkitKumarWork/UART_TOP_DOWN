`timescale 1ns/1ps
module COMPARATOR(
    input [3:0] bit_index,
    output CMP
);
localparam N = 10 ; // number of BITS to be transmitted
reg temp_CMP;
always @(*
)
begin
    if(bit_index == N-1)
        temp_CMP = 1;
    else 
        temp_CMP = 0;
end
assign CMP = temp_CMP;
endmodule