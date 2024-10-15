module gate(
	input clock,
	input rst_n,
	output reg gate
);

reg [24:0] gate_cnt;

parameter GATE_CNT = 25'd50_000;

//gate time //
always@(posedge clock or negedge rst_n) begin
 if (!rst_n)
  gate_cnt <= 1'b0;
 else if (gate_cnt < GATE_CNT - 1'b1)
  gate_cnt <= gate_cnt + 1'b1;
 else 
  gate_cnt <= 1'b0;
end

always@(posedge clock or negedge rst_n) begin
 if (!rst_n)
  gate <= 1'b0;
 else if (gate_cnt < GATE_CNT/2)
  gate <= 1'b1;
 else 
  gate <= 1'b0;
end









endmodule
