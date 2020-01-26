module mux(LESDR, SW);
    input [9:0] SW;
    output [9:0] LESDR;
	 wire Connection1;
	 wire Connection2;
	 
    mux2to1 b0(
        .x(SW[0]),
        .y(SW[1]),
		  .s(SW[8]),
        .m(Connection1)
        );
	
    mux2to1 b1(
		  .x(SW[2]),
        .y(SW[3]),
		  .s(SW[8]),
        .m(Connection2)
        );
		  
    mux2to1 b2(
        .x(Connection1),
        .y(Connection2),
		  .s(SW[9]),
        .m(LESDR[0])
        );
endmodule

module mux2to1(x, y, s, m);
    input x; 
    input y; 
    input s; 
    output m; 
  
    assign m = s & y | ~s & x;
    // OR
    // Assign m = s ? y : x;

endmodule
