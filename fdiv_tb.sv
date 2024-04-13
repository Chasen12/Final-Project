`timescale 1ns / 1ps
module tb();

   logic  [31:0] N;
   logic 	[31:0] D;
   logic  [1:0] rm;
   logic 	op, enc, ena, enb;
   logic        reset;   
   logic  clk; 
   logic 	[31:0] Q; 
   
  // instantiate device under test
   fdiv dut (N, D, rm, op, enc, ena, enb, reset, clk, Q);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


   initial
     begin
    
	#0   N = 32'b00111111101010011000100100110111;	
	#0   D =  32'b00111111100011110101110000101001;	
	#0   rm = 2'b0;
   #0   op = 1'b0;	
	#0   reset = 1'b0;
   #0   enc = 1'b0;
   #0   enb = 1'b0;
   #0   ena = 1'b1;
   #50  ena = 1'b0;
   #5   rm  = 2'b01;
   #0   enb = 1'b1;
   #0   enc = 1'b1;
	
	
     end

   
endmodule
