module d_ff(
 input d, clk, rst,
 output reg q,
 output q_b
);

always @(posedge clk or posedge rst) begin
if (rst)
   q<=1'b0;
else
   q<=d;
end

assign q_b =~q;
endmodule

module sync_up(
  input clk,rst,
  output [3:0] q
);
wire d0,d1,d2,d3;
wire q_b0,q_b1,q_b2,q_b3;

assign d0 = ~q[0];
assign d1 = q[1] ^ q[0];
assign d2 = q[2] ^ (q[1] & q[0]);
assign d3 = q[3] ^ (q[2] & q[1] & q[0]);

dff ff0 (.d(d0),.clk(clk),.rst(rst),.q(q[0]),.q_b(q_b0));
dff ff1 (.d(d1),.clk(clk),.rst(rst),.q(q[1]),.q_b(q_b1));
dff ff2 (.d(d2),.clk(clk),.rst(rst),.q(q[2]),.q_b(q_b2));
dff ff3 (.d(d3),.clk(clk),.rst(rst),.q(q[3]),.q_b(q_b3));
endmodule
  
 
  

