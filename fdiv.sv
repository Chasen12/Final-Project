module fdiv (input  logic [31:0] N, D,
			input  logic [1:0] c1,
			input  logic [5:0] op,
			input  logic rm,
			input  logic reset,
			input  logic clk ,
            output logic [31:0] Q);

logic [29:0] ia;
logic [29:0] ina ;
logic [29:0] inb ;
logic [29:0] regc;
logic [29:0] rega;
logic [29:0] regb;
logic [29:0] regd;
logic [59:0] mult_output;
logic [59:0] comp_output;
logic [29:0] Nf;
logic [29:0] Df;
logic [29:0] rem;
logic [29:0] prem;
logic [29:0] rn;
logic [29:0] rz;
logic [29:0] mat;
logic [29:0] trunc;
logic [29:0] inc;
logic [29:0] dec;
logic [29:0] rne;
logic [1:0] rzd;
//unpack N and D data to 30 bit var

assign Nf = 30'b100000000000000000000000000000 | {N[22:0], 6'b0};
assign Df = 30'b100000000000000000000000000000 | {D[22:0], 6'b0};
assign ia = 30'b011000000000000000000000000000;

// gets us our signed bit 
//assign Q = N[31] ^ D[31];



//multiplication muxes
mux4 muxA (ia, regc, rega, prem, op[1:0], ina);
mux4 muxB (Nf, Df, rega, regb, c1, inb);
////rounding mode mux

mux4 muxRN (trunc, dec, inc, rne, rzd, rn);

//regs
flopren RA (clk, reset, op [4], mult_output [58:29], rega);
flopren RC (clk, reset, op [2], comp_output [58:29], regc);
flopren RB (clk, reset, op [3], mult_output [58:29], regb);
flopren RD (clk, reset, op [5], mult_output [59:30], regd);

//computation
assign mult_output = ina * inb;
assign comp_output  = ~mult_output;
assign rem = regd - Nf;
  
//the rounding hell hole



assign trunc = rega + 30'b000000000000000000000000010000;
assign inc = rega + 30'b000000000000000000000001010000;
assign dec = rega + 30'b111111111111111111111111001111;


assign Q [31] = N[31] ^ D[31];
assign Q [22:0] = rn [28:5];
//assign Q 





always @(*)
  begin
    case ({rega[6], rem[29:28], rm})
      4'b0000  : rzd <= 0;	
      4'b0001  : rzd <= 0;
      4'b0010  : rzd <= 0;
      4'b0011  : rzd <= 0;
	  4'b0100  : rzd <= 0;
	  4'b0101  : rzd <= 0;
      4'b0110  : rzd <= 0;
      4'b0111  : rzd <= 1;
	  4'b1000  : rzd <= 3;	
      4'b1001  : rzd <= 0;
      4'b1010  : rzd <= 2;
      4'b1011  : rzd <= 0;
	  4'b1100  : rzd <= 0;
	  4'b1101  : rzd <= 0;
      4'b1110  : rzd <= 0;
      4'b1111  : rzd <= 0;
      default : rzd <= 0; 
    endcase
  end




endmodule
//00.0000000000000000000000010000
//00.0000000000000000000001010000
//11.1111111111111111111111001111
//00.110000000000000000000000000000
//00.11000000000000000000000000000