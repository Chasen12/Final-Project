module fdiv(input  logic [31:0] N, D,
			input  logic [1:0] rm,
			input  logic op,
			input  logic reset,
			input  logic clk ,
            output logic [31:0] Q);

logic ia [29:0];
logic A  [29:0];
logic B  [29:0];
logic regc [59:0];
logic rega [59:0];
logic regb [59:0];
logic output [59:0];
logic output2s [59:0];
logic Nf [29:0];
logic Df [29:0];

//unpack N and D data to 30 bit var

assign Nf = 0'b000000100000000000000000000000 + N[22:0];
assign Df = 0'b000000100000000000000000000000 + D[22:0];
assign ia = 0'b000000100000000000000000000000

// gets us our signed bit 
assign Q = N[31] ^ D[31]




mux2 muxA (ia, regc[59:30], op, A);
mux4 muxB (Nf, Df, rega[59:30], regb[59:30], rm, B);

flopren RC (clk, reset, enc, output, regc);
flopren RA (clk, reset, ena, output2s, rega);
flopren RB (clk, reset, enb, output, regb);


assign output = A * B;
// need to work out two complment logic

assign output2s  = ~output + 0'b1;
  
  
endmodule
