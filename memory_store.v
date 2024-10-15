module memory_store
(
 input  clock,rst_n,        
 input [15:0] signal_in
);

wire wren,wren1,wren2;
wire [15:0]  q,q1,q2;
reg [15:0] count_address;
reg [5:0]  memory_number;

//main code
always @(posedge clock or negedge rst_n)begin
 if(!rst_n)
  count_address<=0;
 else
  count_address<=count_address+1;
 end

always @(posedge clock or negedge rst_n)begin
 if(!rst_n)
  memory_number<=0;
 else if(count_address==65535)        //count_address==2^N-1
  memory_number<=memory_number+1;
end
 
assign wren=(memory_number==0 && rst_n==1)?1:0;
assign wren1=(memory_number==1)?1:0;
assign wren2=(memory_number==2)?1:0;

//include memory 
 
memory_16bits_65536 m0 
(
 .address(count_address),
 .clock(clock),
 .data(signal_in),
 .wren(wren),
 .q(q)
);

memory_16bits_65536 m1 
(
 .address(count_address),
 .clock(clock),
 .data(signal_in),
 .wren(wren1),
 .q(q1)
);

memory_16bits_65536 m2 
(
 .address(count_address),
 .clock(clock),
 .data(signal_in),
 .wren(wren2),
 .q(q2)
);

endmodule
