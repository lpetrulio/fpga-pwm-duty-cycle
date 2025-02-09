module pwm_generator(
    input clk,               // 100Hz clock from clock divider
    input rst,               // Reset signal
    input [6:0] duty_cycle,  // Duty cycle input (0-100)
    output reg pwm_out       // PWM output to LED
);
    reg [6:0] counter;  // 7-bit counter for PWM

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            if (counter < 99)
                counter <= counter + 1;
            else
                counter <= 0;  // Reset counter after 100 cycles

            if (counter < duty_cycle)
                pwm_out <= 1;  // High when within duty cycle range
            else
                pwm_out <= 0;  // Low otherwise
        end
    end
endmodule