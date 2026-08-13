module pwm_generator (
    input clk,
    input reset,
    input [3:0] duty_cycle,
    output reg pwm_out
);

    reg [3:0] counter;

    always @(posedge clk) begin

        if (reset) begin
            counter <= 4'd0;
            pwm_out <= 1'b0;
        end

        else begin

            // Counter
            if (counter == 4'd15)
                counter <= 4'd0;
            else
                counter <= counter + 1;

            // PWM output
            if (counter < duty_cycle)
                pwm_out <= 1'b1;
            else
                pwm_out <= 1'b0;

        end

    end

endmodule
