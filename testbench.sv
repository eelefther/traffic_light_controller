module test;
  reg clk_test, reset_test;
  wire [2:0] test_main;
  wire [2:0] test_side;
  
  traffic_light_controller tlc(
    .clk(clk_test),
    .reset(reset_test),
    .main_light(test_main),
    .side_light(test_side)
  );
  
  always #5 clk_test = ~clk_test;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
    
    clk_test = 1'b0;
    reset_test = 1'b1;
    
    #10;
    
    reset_test = 1'b0;
    
    #400;
    $finish;
    
  end 
  
endmodule
  
