`timescale 1ns/1ps

module pwm_generator_tb;

    reg clk;
    reg reset;
    reg [3:0] duty_cycle;

    wire pwm_out;

    // Connect PWM generator
    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform
        $dumpfile("output.vcd");
        $dumpvars(0, pwm_generator_tb);

        // Initial values
        clk = 0;
        reset = 1;
        duty_cycle = 4'd0;

        #10;

        // Release reset
        reset = 0;

        // 25% duty cycle
        duty_cycle = 4'd4;
        #160;

        // 50% duty cycle
        duty_cycle = 4'd8;
        #160;

        // 75% duty cycle
        duty_cycle = 4'd12;
        #160;

        $finish;

    end

endmodule