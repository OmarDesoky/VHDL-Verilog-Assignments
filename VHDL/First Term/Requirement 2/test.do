vsim -gui work.alsu

view source
view objects
view variables
view wave -dock

delete wave *
add wave *


force -deposit /INA 16#0F0F, 16#FFFF 400, 16#0F0E 1000, 16#FFFF 1200, 16#0F0F 1400
force -deposit /INB 16#0001
force -deposit /SELECTION 2#0000, 2#0001 200, 2#0010 600, 2#0011 800, 2#0000 1000, 2#0001 1200, 2#0010 1400, 2#0011 1600
force -deposit /CARRYIN 0, 1 1000

run 2000

force -deposit /INA 16#0F0F, 16#F0F0 2000
force -deposit /INB 16#000A
force -deposit /CARRYIN 0 1400, 1 1600, 0 2200, 1 2400
force -deposit /SELECTION 2#0100, 2#0101 200, 2#0110 400, 2#0111 600, 2#1000 800, 2#1001 1000, 2#1111 1200, 2#1010 1400, 2#1100 1800, 2#1101 2000, 2#1110 2200, 2#1011 2600

run 2800