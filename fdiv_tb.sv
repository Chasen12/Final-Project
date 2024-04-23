`timescale 1ns / 1ps
module tb();

   logic  [31:0] N;
   logic 	[31:0] D;
   logic  [1:0] c1;
   logic 	[5:0] op;
   logic  rm;
   logic        reset;   
   logic  clk; 
   logic 	[31:0] Q; 
   
  // instantiate device under test
   fdiv dut (N, D, c1, op, rm, reset, clk, Q);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


  


   initial
     begin
    //setup
	#0   N =  32'b00111111110000000000000000000000;	
	#0   D =  32'b00111111101000000000000000000000;	
  #0   reset = 1'b0;
  //cycl1
  #0   rm = 1'b0;
	#0   c1 = 2'b00;
  #0   op = 6'b010000;

  #30  c1  = 2'b01;
  #0   op = 6'b001100;

//cycle 2
  #20  c1 = 2'b10;
  #0   op = 6'b010001;
  
  
  #20  c1 = 2'b11;
  #0   op = 6'b001101;

  //cycle3
  #20 op = 6'b010001;
  #0  c1 = 2'b10;
  
  
  #20  c1 = 2'b11;
  #0   op = 6'b001101;

//CYCLE4
  #20  op = 6'b010001;
  #0  c1 = 2'b10;
  
  
  #20   c1 = 2'b11;
  #0   op = 6'b001101;

//cycle5
  #20  op = 6'b010001;
  #0  c1 = 2'b10;
  
  
  #20   c1 = 2'b11;
  #0   op = 6'b001101;

//cycle6
  #20  op = 6'b010001;
  #0  c1 = 2'b10;
  
  
  #20   rm = 2'b11;
  #0   op = 6'b001101;


  // rounding cycle

  #20   rm = 2'b01;
  #0    op = 6'b100010;











	
	
     end

   
endmodule
