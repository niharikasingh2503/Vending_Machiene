module vending_machine_tb;
  
  //inputs
  reg clk;
  reg[1:0] in;
  reg rst;
  
  //output
  wire out;
  wire[1:0] change;
  wire[1:0] c_state;
  wire[1:0] n_state;
  
  
  //instantiate our module
  vending_machine_18105070 uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change),
    .c_state(c_state),
    .n_state(n_state)
  );
  
  initial begin
    
    //initialise inputs
   $dumpfile("vending_machine_18105070.vcd");
    $dumpvars(0,vending_machine_tb);
    rst = 1;
    clk = 0;
    
    #6 rst = 0;
    
    in = 10;
    #11 in = 10; 
    #16 in = 1;
    #25 $finish;
    
  end
  always #5 clk = ~clk;
  
endmodule