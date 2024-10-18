module synchronizer(
	input async_signal,
	input rst_n,
	input clock,
	
	output reg sync_signal
);

reg Q1;

assign D2 = Q1;


always@(posedge clock or negedge rst_n) begin
	if(!rst_n) begin
	Q1 <= 1'b0;
	end
	
	else begin
	Q1 <= async_signal;
	end
end


always@(posedge clock or negedge rst_n) begin
	if(!rst_n) begin
	sync_signal <= 1'b0;
	end
	
	else begin
	sync_signal <= D2;
	end
end


endmodule
