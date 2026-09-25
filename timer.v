module lock_fsm_timer #(parameter TIMEOUT = 12)
(
    input clk, input rst,
    input btnU, input btnL, input btnR,
    output reg [3:0] disp
);
    // ... states as in Task 2 ...
    reg [15:0] tcount;
    wire timeout = (tcount >= TIMEOUT);
    wire press   = btnU | btnL | btnR;
    wire counting = (state==S_READY)||(state==S_1)||(state==S_2)||(state==S_3);

    always @(*) begin
        next = state;
        case (state)
            S_READY: if (timeout) next=S_ERR; else if (press) next=(btnU&~btnL&~btnR)?S_1 :S_ERR;
            S_1    : if (timeout) next=S_ERR; else if (press) next=(btnL&~btnU&~btnR)?S_2 :S_ERR;
            S_2    : if (timeout) next=S_ERR; else if (press) next=(btnL&~btnU&~btnR)?S_3 :S_ERR;
            S_3    : if (timeout) next=S_ERR; else if (press) next=(btnR&~btnU&~btnL)?S_OK:S_ERR;
            S_OK   : next=S_OK;
            S_ERR  : next=S_ERR;
            default: next=S_ERR;
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin state<=S_READY; tcount<=0; end
        else begin
            state <= next;
            if (counting) tcount <= tcount + 1'b1;
        end
    end
    // disp output block identical to Task 2
endmodule