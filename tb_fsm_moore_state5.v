`timescale 1ns / 1ps

module tb_fsm_moore_state5();

    reg        clk;
    reg        reset;
    reg  [2:0] sw;
    wire [2:0] led;

    initial clk = 0;
    always #5 clk = ~clk;

    fsm_moore_state5 dut (
        .clk   (clk),
        .reset (reset),
        .sw    (sw),
        .led   (led)
    );

    initial begin
        reset = 1;
        sw = 3'b000;
        #10;
        reset = 0;

        sw = 3'b001; #20;
        sw = 3'b010; #20;
        sw = 3'b011; #20;
        sw = 3'b100; #20;
        sw = 3'b111; #20;
        sw = 3'b001; #20;
        sw = 3'b010; #20;
        sw = 3'b011; #20;
        sw = 3'b100; #20;
        sw = 3'b000; #20;

        $finish;
    end

endmodule
