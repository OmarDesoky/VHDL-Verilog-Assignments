module BCD_Utility_Block (
    input[3:0] a,
    output[3:0] y
);
reg[3:0] r1;
always @(a)
begin
    if (a >= 4'b0101) 
        r1 = a + 4'b0011;
    else
        r1 = a;
    
end
assign y = r1;
endmodule