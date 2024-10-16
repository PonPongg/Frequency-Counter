module edge_detector         
(
    input clk, 
	 input rst_n,
    input pulse,
  
    output pos_edge,
    output neg_edge
    
);

reg pulse_r1;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
    pulse_r1 <= 1'b0;
   end
	
	else begin
    pulse_r1 <= pulse;
   end
end
    
assign pos_edge = (pulse && ~pulse_r1);
assign neg_edge = (~pulse && pulse_r1); 


endmodule
