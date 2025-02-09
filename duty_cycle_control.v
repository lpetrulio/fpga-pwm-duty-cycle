module duty_cycle_control(
    input clk,        // 100Hz clock from clock divider
    input rst,        // Reset signal
    input btn_up,     // Button to increase duty cycle
    input btn_down,   // Button to decrease duty cycle
    output reg [6:0] duty_cycle // Duty cycle (0-100)
);
    reg btn_up_prev, btn_down_prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            duty_cycle <= 50; // Start at 50% duty cycle
            btn_up_prev <= 0;
            btn_down_prev <= 0;
        end else begin
            if (btn_up && !btn_up_prev && duty_cycle < 100)
                duty_cycle <= duty_cycle + 5; // Increase by 5%
            if (btn_down && !btn_down_prev && duty_cycle > 0)
                duty_cycle <= duty_cycle - 5; // Decrease by 5%

            btn_up_prev <= btn_up;
            btn_down_prev <= btn_down;
        end
    end
endmodule