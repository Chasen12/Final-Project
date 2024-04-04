module fdiv(input  logic [31:0] N, D,
			input  logic [1:0] rm,
			input  logic op,
			input  logic reset,
			input  logic clk ,
            output logic [31:0] Q);

logic ia [29:0];
logic A  [59:0];
logic B  [59:0];
logic regc [59:0];
logic rega [59:0];
logic regb [59:0];
logic output [29:0];

logic Nf [29:0];
logic Df [29:0];

mux2 muxA (ia, regc, op, A);
mux4 muxB (N, D, rega, regb, rm, B);

flopren RC (clk, reset, enc, output, regc);
flopren RA (clk, reset, ena, output, rega);
flopren RB (clk, reset, enb, output, regb);


//unpack data

assign Nf = 0'b00000000000000000000000000000 + N;
assign Df = 0'b00000000000000000000000000000 + D;


// gets us our signed bit 
assign Q = N[31] ^ D[31]







assign output = A * B;

  
  
  
  

  
  
  
  
endmodule
