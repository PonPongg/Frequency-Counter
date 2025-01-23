module DE10_without_sysbuilder(
    input fin,
    input rst_n_unsync,
    input enable,
    output reg [9:0] cnt
);


assign rst_nr0 = locked & rst_n_unsync;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire rst_n;

wire rst_nr0, rst_sys;

wire enable_sync, enable_div2, enable_d2, enable_d4;

wire sample;

wire locked, outclk_1MHz;




//sub-module//

Delay_2 Delay_sync(           
	 .Delay_in(enable),
	 .rst_n(rst_sys),
	 .clk(outclk_1MHz),
	 .Delay_out(enable_sync)
);

div2 in_divider(
    .pre_div(enable_sync),
    .rst_n(rst_sys),
	.div2(enable_div2)
);

Delay_2 Delay_d2(           
	 .Delay_in(enable_div2),
	 .rst_n(rst_sys),
	 .clk(outclk_1MHz),
	 .Delay_out(enable_d2)
);

Delay_2 Delay_d4(           
	 .Delay_in(enable_d2),
	 .rst_n(rst_sys),
	 .clk(outclk_1MHz),
	 .Delay_out(enable_d4)
);



sync_async_reset sync_async_reset_pll(
    .clock(fin),
    .reset_n(rst_n_unsync),
    .rst_n(rst_n)
);

sync_async_reset sync_async_reset_sys(    //modify: sys_rst
    .clock(outclk_1MHz),
    .reset_n(rst_nr0),
    .rst_n(rst_sys)
);



sample sample1(
	 .clk(outclk_1MHz),
	 .rst_n(rst_sys),
	 .sample(sample)
);

counter counter1(
	.clk(outclk_1MHz),
	.rst_n(rst_sys),
	.enable(enable_div2),
	.enable_sync(enable_d2),
	.enable_sync_d2(enable_d4),
	.cnt(cnt)
);



memory_store memory_store1(
    .clk(outclk_1MHz),
    .mem_valid(sample),
    .rst_n(rst_sys),         
    .signal_in(cnt)              //modify
);

pll_1_0002 pll_1_inst1(
		.refclk   (fin),   //  refclk.clk
		.rst      (~rst_n),      //   reset.reset
		.outclk_0 (outclk_1MHz), // outclk0.clk
		.locked   (locked)    //  locked.export
	);

//=======================================================
//  Structural coding
//=======================================================



endmodule
