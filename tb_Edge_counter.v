`timescale 1ns/1ps
 
module tb_Edge_counter();
	reg fin;
	reg clk;
	reg async_rst_n;
	wire [15:0] cnt_out;
 
Edge_counter Edge_counter(
	.fin(fin),
	.clk(clk),
	.async_rst_n(async_rst_n),
	.cnt_out(cnt_out)  
);

initial begin
	clk = 1'b0;				
	async_rst_n <= 1'b0;			
	fin	<= 1'b0;	
	#7							
	async_rst_n <= 1'b1;			
end

always #10 clk = ~clk;		
always #9011 fin = ~fin;
 
endmodule
