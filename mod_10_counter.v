module mod_10_counter(SW, KEY, HEX0, Cout);
	input [2:0] SW;
	input [0:0] KEY;
	output [6:0] HEX0;

	assign resetn = SW[0];
	wire [1:0] w = SW[2:1];
	assign Clock = ~KEY[0];

	output reg [3:0] Cout;

	wire a,b,c,d,e,f,g;



always @(posedge Clock) begin
	if (resetn) begin 
	Cout = 4'b0000;
	end 
	else begin 
	case(w)

	2'b00: 
			Cout <= Cout;
	2'b01:
			if(Cout == 9)
			Cout <= 4'b0000;
			else
			Cout <= Cout + 4'b0001;
	2'b10:
			if(Cout == 9)
			Cout <= 4'b0001;
			else
			Cout <= Cout + 4'b0010;
	2'b11:
			if(Cout == 0)
			Cout <= 4'b1001;
			else
			Cout <= Cout - 4'b0001;


		endcase
	end
end
	BCD bcd_inst(.A(Cout[3]), .B(Cout[2]), .C(Cout[1]), .D(Cout[0]), .a(a), .b(b), .c(c), .d(d), .e(e)
	, .f(f), .g(g));

	assign HEX0[0] = a;
		assign HEX0[1] = b;
		assign HEX0[2] = c;
		assign HEX0[3] = d;
		assign HEX0[4] = e;
		assign HEX0[5] = f;
		assign HEX0[6] = g;

	
endmodule