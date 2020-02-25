module BCD(
    input[7:0] a,
    output[3:0] hundredth,
    output[3:0] tenth,
    output[3:0] units
);
wire [3:0] out1;
wire [3:0] out2;
wire [3:0] out3;
wire [3:0] out4;
wire [3:0] out5;
wire [3:0] out6;
wire [3:0] out7;

BCD_Utility_Block ub1 ({1'b0,a[7],a[6],a[5]}, out1);
BCD_Utility_Block ub2 ({out1[2], out1[1], out1[0], a[4]}, out2);
BCD_Utility_Block ub3 ({out2[2], out2[1], out2[0], a[3]}, out3);
BCD_Utility_Block ub4 ({1'b0, out1[3], out2[3], out3[3]}, out4);
BCD_Utility_Block ub5 ({out3[2], out3[1], out3[0], a[2]}, out5);
BCD_Utility_Block ub6 ({out4[2], out4[1], out4[0], out5[3]}, out6);
BCD_Utility_Block ub7 ({out5[2], out5[1], out5[0], a[1]}, out7);

assign hundredth = {2'b0, 2'b0, out4[3], out6[3]};
assign tenth = {out6[2], out6[1], out6[0], out7[3]};
assign units = {out7[2],out7[1], out7[0], a[0]};
endmodule // BCD