module mux (
   input select,
   input [2:0]  inp1,
   input [2:0]  inp2,
   output [2:0] out
   );
   
   reg [2:0] temp;
   always @(inp1,inp2,select) begin
   if(select == 1'b0)
    temp = inp1;
   else
    temp = inp2;
   end
   
  assign out = temp;
endmodule
