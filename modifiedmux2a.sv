// 4.5: mux2a

module mux2a(input  logic [7:0] d0, d1, 
            input  logic       s,
            output logic [7:0] y);

   assign y = s ? d1 : d0; 
endmodule
