# PWM Generator

## Description

This project implements a simple PWM (Pulse Width Modulation) Generator using Verilog HDL.

PWM generates a digital signal that is HIGH for a certain amount of time and LOW for the remaining time.

The duty cycle can be changed using the duty cycle input.

## Inputs

| Input | Size | Description |
|------|------|-------------|
| clk | 1-bit | Clock signal |
| reset | 1-bit | Resets the PWM |
| duty_cycle | 4-bit | Controls the PWM duty cycle |

## Output

| Output | Description |
|--------|-------------|
| pwm_out | PWM output signal |

## Duty Cycle

The duty cycle is controlled using a 4-bit value.

| Duty Cycle Input | Approximate Duty Cycle |
|------------------|------------------------|
| 0 | 0% |
| 4 | 25% |
| 8 | 50% |
| 12 | 75% |
| 15 | 100% |

## Working

A counter continuously counts from 0 to 15.

The PWM output is HIGH when:

    counter < duty_cycle

Otherwise, the PWM output is LOW.

## Files

- README.md - Project documentation
- pwm_generator.v - Main Verilog code
- pwm_generator_tb.v - Testbench
- output.vcd - Simulation waveform

## How to Run

Compile:

    iverilog -o pwm_sim pwm_generator.v pwm_generator_tb.v

Run:

    vvp pwm_sim

Open waveform:

    gtkwave output.vcd

## Expected Result

For a duty cycle of 50%, the PWM output should be HIGH for approximately half of the period and LOW for the other half.

## Conclusion

The PWM Generator successfully generates a PWM signal with a controllable duty cycle.