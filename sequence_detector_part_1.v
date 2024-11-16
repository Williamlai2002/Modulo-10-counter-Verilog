module sequence_detector_part_1 (SW, KEY, LEDR);
	input [1:0] SW;
	input [0:0] KEY;
	output [9:0] LEDR;
	wire Clock, Resetn;
	assign Clock = ~KEY[0];
	assign Resetn = SW[0];
	// what other wires need to be defined here ...
	
	// wire output 
	wire y0, y1, y2, y3, y4, y5, y6, y7, y8;
	wire d0, d1, d2, d3, d4, d5, d6, d7, d8;
	// instantiate flip flops for each state:
	flipflop State_A(.D(d0), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y0));
	flipflop State_B(.D(d1), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y1));
	flipflop State_c(.D(d2), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y2));
	flipflop State_D(.D(d3), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y3));
	flipflop State_E(.D(d4), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y4));
	flipflop State_F(.D(d5), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y5));
	flipflop State_G(.D(d6), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y6));
	flipflop State_H(.D(d7), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y7));
	flipflop State_I(.D(d8), .Clock(~KEY[0]) , .Resetn(SW[0]), .Setn(1), .Q(y8));
	
	
	
	
	// define next state logic for each flip flop:
	assign d0 = Resetn; //A
	assign d1 = (y0 & ~SW[1]) | (y5 & ~SW[1]) | (y6 & ~SW[1]) | (y7 & ~SW[1]) | (y8 & ~SW[1]); //B
	assign d2 = (y1 & ~SW[1]); //C
	assign d3 = (y2 & ~SW[1]); //D
	assign d4 = (y3 & ~SW[1]) | (y4 & ~SW[1]); //E
	assign d5 = (y0 & SW[1]) | (y1 & SW[1]) | (y2 & SW[1]) | (y3 & SW[1]) | (y4 & SW[1]); //F
	assign d6 = (y5 & SW[1]); //G
	assign d7 = (y6 & SW[1]); //H
	assign d8 = (y7 & SW[1]) | (y7 & SW[1]); //I

	// assign the state to LEDR[8:0]:
	assign LEDR[0] = y0;
	assign LEDR[1] = y1;
	assign LEDR[2] = y2;
	assign LEDR[3] = y3;
	assign LEDR[4] = y4;
	assign LEDR[5] = y5;
	assign LEDR[6] = y6;
	assign LEDR[7] = y7;
	assign LEDR[8] = y8;
	

	// assign the output to LEDR[9]:
		assign LEDR[9] = y4 | y8;
	

endmodule


module flipflop (D, Clock, Resetn, Setn, Q);
	input D, Clock, Resetn, Setn;
	output reg Q;
	always @(posedge Clock) begin
		if (!Resetn) // synchronous clear
			Q <= 1'b0;
		else if (!Setn) // synchronous set
			Q <= 1'b1;
		else
			Q <= D;
	end
endmodule