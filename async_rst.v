module async_rst(
	input async_signal,
	input clk,
	output reg sync_signal
);


reg rst_s1, rst_s2;

always @ (posedge clk or negedge async_signal)

if (!async_signal) begin

rst_s1 <= 1'b0;

sync_signal <= 1'b0;

end

else begin

rst_s1 <= 1'b1;

sync_signal <= rst_s1;

end

endmodule