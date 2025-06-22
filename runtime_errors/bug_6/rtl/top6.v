module top_module (
	input clk,
	input pedControl,
	input longTimeHold,
	input resetn,
	output reg [2:0] outResult
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
			Ped: next = Green;
			Green: next = Yellow;
			Yellow: next = Red;
			default: next = 2'bxx;
		endcase
	end

	always@(state, longTimeHold) begin
		case (state)
			Red: outResult = 3'b100;
			Ped: if(longTimeHold) outResult = 3'b101;
			else outResult = 3'b110;
			Green: if(longTimeHold) outResult = 3'b011;
			else outResult = 3'b010;
			Yellow: outResult = 3'b001;
			default: outResult = 3'b000;
		endcase
	end

endmodule