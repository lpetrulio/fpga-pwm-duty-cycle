module top_module(
    input clk,        // 25MHz system clock
    input rst,        // Reset button
    input btn_up,     // Button to increase duty cycle
    input btn_down,   // Button to decrease duty cycle
    output pwm_led    // PWM output connected to LED
);
    wire slow_clk;     // 100Hz clock from clock divider
    wire [6:0] duty_cycle; // 7-bit duty cycle value
    wire pwm_signal;   // PWM output signal

    // Instantiate Clock Divider (25MHz -> 100Hz)
    clock_divider clk_div(
        .clk(clk),
        .rst(rst),
        .slow_clk(slow_clk)
    );

    // Instantiate Duty Cycle Control
    duty_cycle_control duty_ctrl(
        .clk(slow_clk),    // 100Hz clock
        .rst(rst),
        .btn_up(btn_up),
        .btn_down(btn_down),
        .duty_cycle(duty_cycle)
    );

    // Instantiate PWM Generator
    pwm_generator pwm_gen(
        .clk(slow_clk),
        .rst(rst),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_signal)
    );

    // Assign PWM output to LED
    assign pwm_led = pwm_signal; 

endmodule