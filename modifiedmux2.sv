// 4.5: mux2

module mux2(input  logic [29:0] d0, d1, 
            input  logic       s,
            output logic [29:0] y);

   assign y = s ? d1 : d0; 
endmodule
