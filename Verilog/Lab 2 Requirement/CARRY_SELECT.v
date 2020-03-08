module CarrySelect
  (
   input carryin,
   input [15:0] inputA,
   input [15:0] inputB,
   output [15:0] result,
   output carryout
  );
genvar i;
wire[6:0] carry_check1;
wire[6:0] carry_check2;
wire[6:0] carry_prev;
wire[15:0] res1;
wire[15:0] res2;

fulladder2bit ut (carryin,inputA[1:0],inputB[1:0],{carry_prev[0],result[1:0]});

generate
  for (i =1;i<=7;i=i+1)
  begin
    fulladder2bit u0 (1'b0,inputA[i*2+1:i*2],inputB[i*2+1:i*2],{carry_check1[i-1],res1[i*2+1:i*2]});
    fulladder2bit u1 (1'b1,inputA[i*2+1:i*2],inputB[i*2+1:i*2],{carry_check2[i-1],res2[i*2+1:i*2]});
    mux mx (carry_prev[i-1], {carry_check1[i-1],res1[i*2+1:i*2]} , {carry_check2[i-1],res2[i*2+1: i*2]} , {carry_prev[i],result[i*2+1:i*2]} );
  end 
endgenerate
assign carryout = carry_prev[6];
  
endmodule


