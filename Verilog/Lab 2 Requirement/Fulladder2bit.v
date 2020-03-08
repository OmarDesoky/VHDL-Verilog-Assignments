module fulladder2bit
  (
   input Carryin,
   input [1:0] inputA,
   input [1:0] inputB,
   output [2:0] Result
  );
  
  
  
  assign Result = inputA + inputB + {1'b0, Carryin}; 
  
endmodule
