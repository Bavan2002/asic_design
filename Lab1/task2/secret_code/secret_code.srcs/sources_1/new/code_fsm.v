`timescale 1ns/1ps

module code_fsm(
    input clk,
    input rst,
    input Top,
    input Right,
    input Down,
    input Left,
    output SSD_SG,
    output SSD_EN
);

reg o1_reg, o2_reg;
reg [3:0] current_state, next_state;

// Assume input order is important
parameter [3:0] INIT = 4'b0000;         // Initial state
parameter [3:0] FIRST_T = 4'b0001;      // 'T'
parameter [3:0] PREFIX_TL = 4'b0010;    // '42'
parameter [3:0] PREFIX_TLL = 4'b0011;   // '428' -> final valid state
parameter [3:0] RESULT_TLLR = 4'b0100;

parameter [3:0] FAIL_FIRST = 4'b0101;   // Invalid after 1st input
parameter [3:0] FAIL_SECOND = 4'b0110;  // Invalid after 2nd input
parameter [3:0] FAIL_THIRD = 4'b0111;   // Invalid after 3rd input
parameter [3:0] FAIL_FULLY = 4'b1000;   // Invalid


// State register - active high reset
always @(posedge clk) begin
    if (rst)
        current_state <= INIT;
    else
        current_state <= next_state;     
end

// Next-state logic
always @(*) begin
    next_state = current_state;
    case(current_state)
        // Waiting for first input
        INIT: begin
            if (data == 4)
                next_state = FIRST_4;
            else if (data == 5)
                next_state = FIRST_5;
            else begin
                next_state = FAIL_FIRST;
            end    
        end
        
        // First input was 4
        FIRST_4: next_state = (data == 2) ? PREFIX_42 : FAIL_SECOND;
        
        // First two inputs were 42
        PREFIX_42: next_state = (data == 8) ? RESULT_428 : RESULT_OTHER;

        // First input was 5
        FIRST_5: next_state = (data == 2) ? PREFIX_52 : FAIL_SECOND;
        
        // First two inputs were 52
        PREFIX_52: next_state = (data == 8) ? RESULT_528 : RESULT_OTHER;
        
        // Sequence already invalid after first input.
        FAIL_FIRST: next_state = FAIL_SECOND;

        // Sequence already invalid after first/second input.
        FAIL_SECOND: next_state = RESULT_OTHER;
        
        // Terminal states
        RESULT_428: next_state = RESULT_428;
        RESULT_528: next_state = RESULT_528;
        RESULT_OTHER: next_state = RESULT_OTHER;
        default: next_state = INIT;

    endcase
end  

// Assume outputs remain 00 until THREE inputs have been received.
always @(*) begin
    case(current_state)
        RESULT_428: {o1_reg, o2_reg} = 2'b10;    // 428
        RESULT_528: {o1_reg, o2_reg} = 2'b01;    // 528
        RESULT_OTHER: {o1_reg, o2_reg} = 2'b11;  // Any other 3-input sequence
        default : {o1_reg, o2_reg} = 2'b00; 
    endcase 
end     
    
assign {o1,o2} = {o1_reg, o2_reg};

endmodule
