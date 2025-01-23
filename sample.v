module sample(
	input clk,
	input rst_n,
	output reg sample
);

reg [14:0] counter;

parameter SAMPLE_CNT = 15'd999;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin
		  counter <= 15'b0;
		  sample <= 1'b0;
	 end
    
	 else
	 if (counter == SAMPLE_CNT) begin
        counter <= 15'b0;
        sample <= 1'b1;
    end
	 
	 else begin
	  counter <= counter + 1'b1;
	  sample <= 1'b0;
    end
end

endmodule
