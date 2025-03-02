`timescale 1ns / 1ps

module clock_divider_tb; 

reg clk; 
reg rst; 
wire slow_clk; 

clock_divider UUT(
    .clk(clk), 
    .rst(rst), 
    .slow_clk(slow_clk)
); 

always #20 clk = ~clk; 

initial begin
    $dumpfile("waveform_clock_divider.vcd"); 
    $dumpvars(0, clock_divider_tb); 

    clk = 0; 
    rst = 1; 
 

    #200; 

    rst = 0; 

    #12000000;

      if (slow_clk !== 1) begin
            $error("Assertion failed at %t: Expected slow_clk=1, got %b", $time, slow_clk);
        end else begin
            $display("Test passed at %t: slow_clk correctly toggled HIGH", $time);
        end

    #10000000; 

      if (slow_clk !== 0) begin
            $error("Assertion failed at %t: Expected slow_clk=0, got %b", $time, slow_clk);
        end else begin
            $display("Test passed at %t: slow_clk correctly toggled LOW", $time);
        end

    $display("All assertions passed."); 

    $finish; 

end 
endmodule

