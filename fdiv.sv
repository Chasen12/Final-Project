module fdiv (input  logic [31:0] N, D,
			input  logic [1:0] c1,
			input  logic [1:0] op,
			input  logic rm;
			input  logic enc, ena, enb,
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
logic [29:0] rem;
logic [59:0] prem;
logic [29:0] rn;
logic [29:0] rz;
logic [29:0] mat;

//unpack N and D data to 30 bit var

assign Nf = 30'b100000000000000000000000000000 | {N[22:0], 6'b0};
assign Df = 30'b100000000000000000000000000000 | {D[22:0], 6'b0};
assign ia = 30'b011000000000000000000000000000;

// gets us our signed bit 
//assign Q = N[31] ^ D[31];



//multiplication
mux4 muxA (ia, regc, rega, prem, op, ina);
mux4 muxB (Nf, Df, rega, regb, c1, inb);
//
mux4 muxRZ ();
mux4 muxRN ();
//rounding mode mux
mux2 muxQ (rn, rz, rm, mat);

flopren RA (clk, reset, ena, mult_output [58:29], rega);
flopren RC (clk, reset, enc, comp_output [58:29], regc);
flopren RB (clk, reset, enb, mult_output [58:29], regb);

assign mult_output = ina * inb;

assign comp_output  = ~mult_output;
// one more cycle


assign rem = mult_output[59:30] - Nf;
  
  
endmodule