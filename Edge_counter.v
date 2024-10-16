module Edge_counter(
	input fin,
	input clk,
	input rst_n,
	output reg [15:0] cnt_out  
);


///reg and wire///

wire en;
wire sync_fin;
wire pos_edge;

reg valid;
reg [1:0] en_cnt;

////sub module////

synchronizer synchronizer1(
	.async_signal(fin),
	.rst_n(rst_n),
	.clock(clk),
	.sync_signal(sync_fin)
);

edge_detector edge_detector1(
    .clk(clk), 
	 .rst_n(rst_n),
    .pulse(sync_fin),
    .pos_edge(pos_edge)
);

enable enable1(
	 .clk(clk),
	 .rst_n(rst_n),
	 .en(en)
);


memory_store memory_store1(
	.clock(valid),
	.rst_n(rst_n),         
	.signal_in(cnt_out)         
);




////code////

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		en_cnt <= 2'b00;
		valid <= 1'b0;
	end
	
	else 
	if(en_cnt == 2'b10) begin
		en_cnt <= 2'b00;
		valid <= 1'b1;
	end
	
	else
	if(en) begin
		en_cnt <= en_cnt + 2'b01;
		valid <= 1'b0;
	end
	
end


always @(posedge clk or negedge rst_n)begin	
	if(!rst_n) begin
		cnt_out <= 1'b0;
	end
	
	else 
	if(en_cnt == 2'b01 && pos_edge == 1'b1) begin
		cnt_out <= cnt_out + 1'b1;
	end
	
	else 
	if(en_cnt == 2'b00) begin
		cnt_out <= 1'b0;
	end
	
end

endmodule



