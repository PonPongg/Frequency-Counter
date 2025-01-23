module Delay_2(
	input 			Delay_in,
	input 			rst_n,
	input 			clk,
	output reg Delay_out
);


reg Q1;
 
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		Q1 <= 1'b0;
		Delay_out <= 1'b0;
	end
	else begin
		Q1 <= Delay_in;
		Delay_out <= Q1;
	end
end

endmodule
