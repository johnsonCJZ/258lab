//SW[3:0] data inputs


//HEX[6:0] output display

module hex(HEX, SW);
    input [3:0] SW;
    output [6:0] HEX;

    assign HEX[0] = ~SW[3] & ~SW[2] & ~SW[1] & SW[0] |
                    ~SW[3] & SW[2] & ~SW[1] & ~SW[0] |
                    SW[3] & ~SW[2] & SW[1] & SW[0] |
                    SW[3] & SW[2] & ~SW[1] & SW[0];
    assign HEX[1] = SW[3] & SW[2] & ~SW[1] & ~SW[0] |
                    ~SW[3] & SW[2] & ~SW[1] & SW[0] |
                    SW[3] & SW[1] & SW[0] |
                    SW[2] & SW[1] & ~SW[0];
    assign HEX[2] = SW[3] & SW[2] & ~SW[1] & ~SW[0] |
                    ~SW[3] & ~SW[2] & SW[1] & ~SW[0] |
                    SW[3] & SW[2] & SW[1];
    assign HEX[3] = ~SW[2] & ~SW[1] & SW[0] |
                    ~SW[3] & SW[2] & ~SW[1] & ~SW[0] |
                    SW[2] & SW[1] & SW[0] |
                    SW[3] & ~SW[2] & SW[1] & ~SW[0];
    assign HEX[4] = ~SW[3] & SW[2] & ~SW[1] & ~SW[0] |
                    ~SW[3] & SW[0] |
                    SW[3] & ~SW[2] & ~SW[1] & SW[0];
    assign HEX[5] = ~SW[3] & ~SW[2] & ~SW[1] & SW[0] |
                    SW[3] & SW[2] & ~SW[1] & SW[0] |
                    ~SW[3] & SW[1] & SW[0] |
                    ~SW[3] & ~SW[2] & SW[1] & ~SW[0];
    assign HEX[6] = ~SW[3] & ~SW[2] & ~SW[1] |
                    ~SW[3] & SW[2] & SW[1] & SW[0] |
                    SW[3] & SW[2] & ~SW[1] & ~SW[0];
 
endmodule

 
