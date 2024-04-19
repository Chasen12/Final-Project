module fdiv (input  logic [31:0] N, D,
			input  logic [1:0] rm,
			input  logic op, enc, ena, enb,
			input  logic reset,
			input  logic clk ,
            output logic [31:0] Q);

logic [29:0] ia;
logic [29:0] ina ;
logic [29:0] inb ;
logic [29:0] regc;
logic [29:0] rega;
logic [29:0] regb;
logic [59:0] mult_output;
logic [59:0] comp_output;
logic [29:0] Nf;
logic [29:0] Df;

//unpack N and D data to 30 bit var

assign Nf = 30'b100000000000000000000000000000 | {N[22:0], 6'b0};
assign Df = 30'b100000000000000000000000000000 | {D[22:0], 6'b0};
assign ia = 30'b011000000000000000000000000000;

// gets us our signed bit 
//assign Q = N[31] ^ D[31];
mux2 muxA (ia, regc, op, ina);
mux4 muxB (Nf, Df, rega, regb, rm, inb);

flopren RA (clk, reset, ena, mult_output [58:29], rega);
flopren RC (clk, reset, enc, comp_output [58:29], regc);
flopren RB (clk, reset, enb, mult_output [58:29], regb);

assign mult_output = ina * inb;

assign comp_output  = ~mult_output;
  
  
endmodule