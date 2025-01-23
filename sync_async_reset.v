module sync_async_reset(clock,reset_n,rst_n);
 
    input clock, reset_n;
    output rst_n;
 
    reg rst_nr1, rst_nr2;
 
    always @(posedge clock or negedge reset_n) begin
        if(!reset_n) begin
			rst_nr1 <= 1'b0;
            rst_nr2 <= 1'b0;		
        end
        else begin
			rst_nr1 <= 1'b1;
			rst_nr2 <= rst_nr1;		
		end
    end
	
	assign rst_n = rst_nr2;
	
endmodule							