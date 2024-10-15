module edge_detector
(
    input clk, rst_n,
    input pulse,
    
    output pos_edge,
    output neg_edge
    
);
reg pulse_r1, pulse_r2, pulse_r3;

always @ (posedge clk or negedge rst_n)
if(!rst_n) 
    begin
    pulse_r1 <= 1'b0;
    pulse_r2 <= 1'b0;
    pulse_r3 <= 1'b0;
    end
else 
    begin
    pulse_r1 <= pulse;
    pulse_r2 <= pulse_r1;
    pulse_r3 <= pulse_r2;
    end
    
assign pos_edge = (pulse_r2 && ~pulse_r3) ?1'b1:1'b0;
assign neg_edge = (~pulse_r2 && pulse_r3) ?1'b1:1'b0; 


endmodule
