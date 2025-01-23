module div2(
    input pre_div,
    input rst_n,

    output reg div2
);

reg div_cnt;

always@(posedge pre_div or negedge rst_n)begin
    if(!rst_n)
        div_cnt <= 1'b0;
    else if(div_cnt == 1)
        div_cnt <= 1'b0;
    else
        div_cnt <= div_cnt + 1'b1;
end

always@(posedge pre_div or negedge rst_n)begin
    if(!rst_n)
        div2 <= 1'b0;
    else if(div_cnt < 1)
        div2 <= 1'b0;
    else
        div2 <= 1'b1;
end

endmodule