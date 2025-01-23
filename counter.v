module counter(
	input clk,
	input rst_n,
	input enable,
	input enable_sync,
	input enable_sync_d2,
	output reg [9:0] cnt
);

reg [9:0] cnt_reg;

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cnt <= 10'b0;
		cnt_reg <= 10'b0;
	end
	else if((enable_sync == 1'b0) && (enable == 1'b1))				// modify condition
		cnt_reg <= 10'b0;		
	else if(enable_sync)
		cnt_reg <= cnt_reg + 1'b1;
	else if(!enable_sync_d2)
		cnt <= cnt_reg;
	else begin
		cnt <= cnt;
		cnt_reg <= cnt_reg;
	end
end

endmodule
