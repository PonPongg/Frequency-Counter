module memory_store
(
 input clock,
 input mem_valid,
 input rst_n,         
 input [15:0] signal_in
);

reg [15:0] count_address;




//code


always @(posedge clock or negedge rst_n) begin
	if(!rst_n) begin
		count_address <= 0;
	end
	
	else
	if(mem_valid) begin
		count_address <= count_address + 1;
	end
	
end


//Quartus 1 port RAM IP
 
memory_16bits_65536 m0 
(
 .address(count_address),
 .clock(clock),
 .data(signal_in),
 .wren(mem_valid)
);


endmodule
