`timescale 1ns / 1ps

module timer(
    input clk,
    input reset,
    input en,
    output reg timeOut
    );
    
    reg [31:0] counter;
    parameter [31:0] timeVal = 1000000000;
    
    always @(posedge clk) begin
        if (reset) begin
            counter = timeVal;
            timeOut = 0;
        end
        else if (en == 1) begin
            if (counter == 0)
                timeOut = 1;
            counter = counter - 1;
        end
    end               
    
endmodule
