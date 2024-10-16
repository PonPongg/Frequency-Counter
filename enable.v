module enable(
	input clk,
	input rst_n,
	output reg en
);

reg [15:0] counter;

parameter GATE_CNT = 16'd49999;

always @(posedge clk or negedge rst_n) begin // needs a reset to set counter + en to 0
    if(!rst_n) begin
		  en <= 1'b0;
		  counter <= 0;
	 end
    
	 else
	 
	 if (counter == GATE_CNT) begin
        counter <= 0;
        en <= 1'b1;
		  
    end
	 
	 else begin
	  counter <= counter + 1'b1;
	  en <= 1'b0;
    end
end

endmodule
