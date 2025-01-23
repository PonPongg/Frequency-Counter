module memory_store
(
 input clk,
 input mem_valid,
 input rst_n,         
 input [9:0] signal_in
);

reg [15:0] count_address;
reg memory_number;
reg full;

wire wren0;

//code

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count_address <= 16'b0;
	else if(count_address == 16'd65535)
		count_address <= 16'b0;
	else if(mem_valid)
		count_address <= count_address + 1'b1;
	else
		count_address <= count_address;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		full <= 1'b0;
	else if(count_address == 16'd65535)
		full <= 1'b1;
	else
		full <= 1'b0;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		memory_number <= 1'b0;
	else if(full)
		memory_number <= memory_number + 1'b1;
	else 
		memory_number <= memory_number;		
end


assign wren0=((memory_number == 0) && mem_valid);

//Quartus 1 port RAM IP
 
memory_10bits_65536 m0 
(
 .address(count_address),
 .clock(clk),
 .data(signal_in),
 .wren(wren0)
);

endmodule
