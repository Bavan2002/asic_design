`timescale 1ns/1ps

module lab_tb;

    reg clk;
    reg reset;
    reg countup;

    wire [6:0] SSG_D;
    wire [2:0] SSG_EN;

    integer display_value;
    integer i;

    // DUT
    lab uut (
        .clk(clk),
        .reset(reset),
        .countup(countup),
        .SSG_D(SSG_D),
        .SSG_EN(SSG_EN)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Convert seven-segment output to readable decimal value
    function integer ssg_to_digit;
        input [6:0] ssg;
        begin
            case (ssg)
                7'b1000000: ssg_to_digit = 0;
                7'b1111001: ssg_to_digit = 1;
                7'b0100100: ssg_to_digit = 2;
                7'b0110000: ssg_to_digit = 3;
                7'b0011001: ssg_to_digit = 4;
                7'b0010010: ssg_to_digit = 5;
                7'b0000010: ssg_to_digit = 6;
                7'b1111000: ssg_to_digit = 7;
                7'b0000000: ssg_to_digit = 8;
                7'b0010000: ssg_to_digit = 9;
                default:    ssg_to_digit = -1;
            endcase
        end
    endfunction

    // Readable value visible in waveform
    always @(*) begin
        display_value = ssg_to_digit(SSG_D);
    end

    initial begin

        clk     = 0;
        reset   = 0;
        countup = 0;

        // Test 1: Reset
        #2;
        reset = 1;
        #120;
        reset = 0;
        #10;

        // Test 2: Single press and release
        countup = 1;
        #30;
        countup = 0;
        #20;

        // Test 3: Another press and release
        countup = 1;
        #20;
        countup = 0;
        #20;

        // Test 4: Long button hold
        // Should only count once after release
        countup = 1;
        #100;
        countup = 0;
        #20;

        // Test 5: Repeated counting
        // Tests all digits including rollover
        for (i = 0; i < 10; i = i + 1) begin
            countup = 1;
            #20;

            countup = 0;
            #20;
        end

        // Test 6: Reset while running
        reset = 1;
        #10;
        reset = 0;
        #20;

        // Test 7: Count again after reset
        countup = 1;
        #20;
        countup = 0;
        #20;

        $finish;
    end
endmodule