module Edge_counter(
	input fin,
	input clk,
	input rst_n,
	output reg [15:0] cnt_out  
);

assign gate_n = ~gate;

////sub module////

edge_detector edge_detector(
    .clk(clk), 
	 .rst_n(rst_n),
    .pulse(fin),
    .pos_edge(pos_edge),
);

gate gate1(
	.clock(clk),                    
	.rst_n(rst_n),
	.gate(gate)
);

memory_store memory_store1(
	.clock(gate_n),
	.rst_n(rst_n),         
	.signal_in(cnt_out)         
);


////code////

always @(posedge clk or negedge rst_n)begin	
	if(!rst_n)
		cnt_out <= 0;
	else if(gate == 1'b1 && pos_edge == 1'b1)                      //gate 1, pos_edge 1
		cnt_out <= cnt_out + 1'b1;
	else if(gate == 1'b1 && pos_edge == 1'b0)                      //gate 1, pos_edge 0
		cnt_out <= cnt_out;
	else if(gate == 1'b0)
		cnt_out <= 0;
end


endmodule



