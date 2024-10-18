module Edge_counter(
	input fin,                   /// fin is an external input signal
	input clk,                   /// clock is 50MHz signal from the FPGA board
	input async_rst_n,           /// async_rst_n is the switch on the FPGA board
	output reg [15:0] cnt_out    /// cnt_out is the output value
);


///reg and wire///

wire enable;
wire sync_fin;
wire pos_edge;
wire rst_n;

reg valid;
reg [15:0] cnt_mem;

////sub module////

synchronizer synchronizer_fin(           /// use synchronizer_fin to sync the input signal
	.async_signal(fin),
	.rst_n(rst_n),
	.clock(clk),
	.sync_signal(sync_fin)
);

async_rst synchronizer_rst_n(            /// use synchronizer_rst_n to sync the async switch control
	.async_signal(async_rst_n),
	.clk(clk),
	.sync_signal(rst_n)
);

edge_detector edge_detector1(            /// use edge_detector1 to detect the input signal's (after sync) edge
    .clk(clk), 
	 .rst_n(rst_n),
    .pulse(sync_fin),
    .pos_edge(pos_edge)
);

enable enable1(                          /// use enable1 to generate an enable signal
                                         /// enable signal can control the output of the counter
	 .clk(clk),
	 .rst_n(rst_n),
	 .en(enable)
);


memory_store memory_store1(              /// use memory_store1 to store the output value of counter into memory
	.clock(clk),
	.mem_valid(valid),
	.rst_n(rst_n),         
	.signal_in(cnt_mem)         
);




////code////



always@(posedge clk or negedge rst_n) begin        /// if enable comes, valid set to 1 for 1 clk
                                                   /// valid set to 1 means the memory can be write
	if(!rst_n) begin
		valid <= 1'b0;
	end
	
	else
	if(enable) begin
      valid <= 1'b1;
	end
	
	else begin
		valid <= 1'b0;
	end
	
end


always @(posedge clk or negedge rst_n) begin          /// when pos_edge comes, counter value + 1
                                                      /// when enable comes, store the counter value to cnt_mem and reset
																		/// cnt_mem connect to the memory's data input.
	 if(!rst_n) begin
	    cnt_out <= 1'b0;
		 cnt_mem <= 1'b0;
	 end
	 
    else 
	 if (pos_edge) begin
        cnt_out <= cnt_out + 1'b1;
    end
	 
    else
	 if (enable) begin
        cnt_out <= 1'b0;
        cnt_mem <= cnt_out;
    end
	 
end

endmodule



