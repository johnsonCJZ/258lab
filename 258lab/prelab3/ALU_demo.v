module ALU_demo(LEDR, SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    input [7:0] SW;
    input [2:0] KEY;
    output [7:0] LEDR;
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire [7:0] ALUout;

    assign LEDR = ALUout;

    ALU m0(
        .ALUout(ALUout),
        .A(SW[7:4]),
        .B(SW[3:0]),
        .select(KEY)
    );

    hex h0(
        .SW(SW[3:0]),
        .HEX(HEX0)
    );

    hex h1(
        .SW(4'b0000),
        .HEX(HEX1)
    );

    hex h2(
        .SW(SW[7:4]),
        .HEX(HEX2)
    );

    hex h3(
        .SW(4'b0000),
        .HEX(HEX3)
    );

    hex h4(
        .SW(ALUout[3:0]),
        .HEX(HEX4)
    );

    hex h5(
        .SW(ALUout[7:4]),
        .HEX(HEX5)
    );

endmodule

module ALU(ALUout, A, B, select);
    output reg [7:0] ALUout = 0;
    input [3:0] A, B;
    input [2:0] select;
    wire [3:0] case1_out, case2_out;
    wire case1_carry, case2_carry;

    always @(*) 
	 begin
        case (select[2:0])
            3'b000: ALUout = {case1_carry, case1_out};
            3'b001: ALUout = {case2_carry, case2_out};
            3'b010: ALUout = A + B;
            3'b011: ALUout = {A|B, A^B};
            3'b100: ALUout = {|({A,B})};
            3'b101: ALUout = {A, B};
            default ALUout = 8'b00000000;
        endcase
    end

    adder a1(
        .S(case1_out),
        .cout(case1_carry),
        .A(A),
        .B(4'b0001),
        .cin(1'b0)
    );

    adder a2(
        .S(case2_out),
        .cout(case2_carry),
        .A(A),
        .B(B),
        .cin(1'b0)
    );

endmodule

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

module adder(S, cout, A, B, cin);
    output [3:0] S;
	 output cout;
    input [3:0] A;
	 input [3:0] B;
    input cin;
	 
	 wire c1, c2, c3;
	 
	 full_adder a0(
			.cin(cin),
			.a(A[0]),
			.b(B[0]),
			.s(S[0]),
			.cout(c1)
	 );
	 
	 full_adder a1(
			.cin(c1),
			.a(A[1]),
			.b(B[1]),
			.s(S[1]),
			.cout(c2)
	 );
	 
	 full_adder a2(
			.cin(c2),
			.a(A[2]),
			.b(B[2]),
			.s(S[2]),
			.cout(c3)
	 );
	 
	 full_adder a3(
			.cin(c3),
			.a(A[3]),
			.b(B[3]),
			.s(S[3]),
			.cout(cout)
	 );	 
endmodule

module full_adder(cin, a, b, s, cout);
    input cin, a, b;
	 output s, cout;
	 
	 assign s = a ^ b ^ cin;
	 assign cout = a & b | (a ^ b) & cin;
        
endmodule
