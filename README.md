# FPGA PWM Duty Cycle Control

This project implements a Pulse Width Modulation (PWM) generator in Verilog, where the duty cycle is controlled via push buttons. The PWM output drives an LED to change length that LED is on/off dynamically.

## Features
- Push-button controlled PWM duty cycle (increments/decrements by 5%).
- PWM frequency: 100Hz (with a 25MHz clock input).
- Clock divider included to generate 100Hz signal from 25MHz.
- PWM LED output adjusts for how long the LED blinks based on duty cycle.
- Designed for FPGA applications.

## Project Structure
- clock_divider.v -> clock divider module
- duty_cycle_control.v -> duty cycle manipulation with push buttons module
- pwm_generator.v -> PWM signal generator based on duty cycle module
- top_module -> top module for project connecting the other modules

## Note: 
- No constraints file was included here. io's that need to be mapped are the following

- pwm_led // the PWM output signal
- btn_up // duty control increment up by 5%
- btn_down // duty control increment down by 5%

- This project was designed for an internal base clock of 25MHz that is reduced to 100Hz within the clock_divider module, adjust this module if your system clock is different
