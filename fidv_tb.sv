`timescale 1ns / 1ps
module tb ();

   logic        N;
   logic 	D;
   logic 	rm;
   logic 	op;
   logic        reset;   
   logic  clk; 
   logic 	Q; 
   
  // instantiate device under test
   silly dut (N, D, rm, op, reset, clk, Q);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


   initial
     begin
    
	#20  a = $random;	
	#0   b = $random;	
	#0   c = $random;
	
	
     end

   
endmodule
