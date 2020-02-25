module SSD(
    input [3:0] binaryNumber,
    output [6:0] controlSignals
);

assign controlSignals =
(binaryNumber == 4'b0000 ) ? 7'b0000001 :
(binaryNumber == 4'b0001 ) ? 7'b1001111 :
(binaryNumber == 4'b0010 ) ? 7'b0010010 :
(binaryNumber == 4'b0011 ) ? 7'b0000110 :
(binaryNumber == 4'b0100 ) ? 7'b1001100 :
(binaryNumber == 4'b0101 ) ? 7'b0100100 :
(binaryNumber == 4'b0110 ) ? 7'b0100000 :
(binaryNumber == 4'b0111 ) ? 7'b0001111 :
(binaryNumber == 4'b1000 ) ? 7'b0000000 :
(binaryNumber == 4'b1001 ) ? 8'b0000100 : 7'b1111111;

endmodule // SSD