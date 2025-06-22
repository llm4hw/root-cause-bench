module top_module (
	input clk,
	input resetn,
	output [1:0] states
);
parameter Red=0, Green=1, Yellow=2, Ped=3;
	reg [1:0] state, next;

	always @(posedge clk) begin
		if (~resetn) state <= Red;
		else state <= next;
	end
	always@(state) begin
		case (state)
			Red: next = Ped;
			Ped: next = Red;
			Green: next = Yellow;
			Yellow: next = Red;
			default: next = 2'bxx;
		endcase
	end
	assign states = state;
endmodule