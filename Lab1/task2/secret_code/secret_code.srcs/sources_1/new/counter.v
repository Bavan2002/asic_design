`timescale 1ns / 1ps

module counter(
    input clk,
    input reset,
    input enCnt,
    output reg countOut
    );
    
    reg [31:0] counter;
    parameter [31:0] countVal = 2;
    
    always @(posedge clk) begin
        if (reset) begin
            counter = countVal;
            countOut = 0;
        end
        else if (enCnt == 1) begin
            counter = counter - 1;
            if (counter == 0)
                countOut = 1;
        end
    end               
    
endmodule
