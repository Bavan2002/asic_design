`timescale 1ns/1ps
module lock_fsm (
    input        clk,
    input        rst,      // synchronous reset (center button)
    input        btnU,     // top
    input        btnL,     // left
    input        btnR,     // right
    output reg [3:0] disp
);
    localparam S_READY = 3'd0;  // shows 0, waiting for TOP
    localparam S_1     = 3'd1;  // got TOP, waiting LEFT
    localparam S_2     = 3'd2;  // got LEFT, waiting LEFT
    localparam S_3     = 3'd3;  // got LEFT, waiting RIGHT
    localparam S_OK    = 3'd4;  // shows 9
    localparam S_ERR   = 3'd5;  // shows E

    reg [2:0] state, next;
    wire press = btnU | btnL | btnR;

    always @(*) begin
        next = state;
        case (state)
            S_READY: if (press) next = (btnU & ~btnL & ~btnR) ? S_1  : S_ERR;
            S_1    : if (press) next = (btnL & ~btnU & ~btnR) ? S_2  : S_ERR;
            S_2    : if (press) next = (btnL & ~btnU & ~btnR) ? S_3  : S_ERR;
            S_3    : if (press) next = (btnR & ~btnU & ~btnL) ? S_OK : S_ERR;
            S_OK   : next = S_OK;
            S_ERR  : next = S_ERR;
            default: next = S_ERR;
        endcase
    end

    always @(posedge clk) begin
        if (rst) state <= S_READY;
        else     state <= next;
    end

    always @(*) begin
        case (state)
            S_OK   : disp = 4'h9;
            S_ERR  : disp = 4'hE;
            default: disp = 4'h0;
        endcase
    end
endmodule