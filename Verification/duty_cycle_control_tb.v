`timescale 1ms / 1us 

module duty_cycle_control_tb; 

reg clk; 
reg rst;
reg btn_up; 
reg btn_down; 
wire [6:0] duty_cycle;

duty_cycle_control UUT(
    .clk(clk), 
    .rst(rst), 
    .btn_up(btn_up),
    .btn_down(btn_down),
    .duty_cycle(duty_cycle)
);


initial clk = 0; 
always #1 clk = ~clk; 

initial begin

    $dumpfile("duty_cycle_control.vcd"); 
    $dumpvars(0, duty_cycle_control_tb); 

    clk = 0; 
    rst = 1; 
    btn_up = 0; 
    btn_down = 0; 

    #2; 

    if (duty_cycle == 50) begin 
        $display("duty cycle is at %d", duty_cycle); 
    end else begin 
            $display("duty cycle is not at 50 when it should be"); 
    end 

    #2; 

    rst = 0; 

    #2; 

    btn_up = 1; 

    #2;

    if (duty_cycle == 55) begin 
        $display("duty cycle is at %d", duty_cycle); 
    end else begin 
            $display("duty cycle is not at 55 when it should be"); 
    end

    #2; 

    btn_up = 0; 
    btn_down = 1; 

    #2;

    if (duty_cycle == 50) begin 
        $display("duty cycle is at %d", duty_cycle); 
    end else begin 
            $display("duty cycle is not at 50 when it should be"); 
    end

    $display("All tests complete"); 

    #2; 
    
    $finish;
end

endmodule

