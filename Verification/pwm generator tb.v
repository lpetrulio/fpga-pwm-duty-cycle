`timescale 1ms / 1us

module pwm_generator_tb; 

reg clk; 
reg rst; 
reg [6:0] duty_cycle;
wire pwm_out; 

pwm_generator UUT(
    .clk(clk), 
    .rst(rst), 
    .duty_cycle(duty_cycle),
    .pwm_out(pwm_out)
); 

initial clk = 0; 
always #5 clk = ~clk; 

initial begin 
    $dumpfile("waveform_pwm_generator.vcs"); 
    $dumpvars(0, pwm_generator_tb); 

    rst = 1; 
    duty_cycle = 50; 

    #30; 

    rst = 0; 

    #1100; 

    rst = 1; 

    #100; 

    rst = 0; 
    duty_cycle = 10; 

    #1110; 

    $finish; 
end
endmodule
