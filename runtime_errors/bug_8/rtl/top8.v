module top_module (
	input clk,
	input pedControl,
	input resetn,
	output reg [1:0] outResult
);
parameter Red=0, Green=1, Yellow=2, Ped=3;
	reg [1:0] state, next;

	always @(posedge clk) begin
		if (~resetn) state <= Red;
		else state <= next;
	end
	always@(state or pedControl) begin
		case (state)
			Red: if (pedControl) next = Ped;
			else next = Green;
			Green: next = Yellow;
			Yellow: next = Red;
			Ped: next = Ped;
			default: next = Red;
		endcase
	end

	always@(state) begin
		case (state)
			Red: outResult = 2'b00;
			Green: outResult = 2'b01;
			Yellow: outResult = 2'b10;
			Ped: outResult = 2'b11;
			default: outResult = 2'bxx;
		endcase
	end

endmodule