module main(
    input[3:0] a,
    input[3:0] b,
    output[6:0] hundredthSS,
    output[6:0] tenthSS,
    output[6:0] unitsSS
);

wire[7:0] mulOut;
wire[3:0] hundredthWire;
wire[3:0] tenthWire;
wire[3:0] unitsWire;

multiplier mul4x4 (a, b, mulOut);
BCD BCDDecoder(mulOut, hundredthWire, tenthWire, unitsWire);
SSD hundredthSSD(hundredthWire, hundredthSS);
SSD tenthSSD(tenthWire, tenthSS);
SSD unitsSSD(unitsWire, unitsSS);

endmodule // main