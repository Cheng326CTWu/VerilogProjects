module alu
(
	clk,
	a,
	b,
	func,
	shamt,
	res
);

	parameter n = 32;

	input clk;
	input [n-1:0] a, b;
	input [2:0] func;
	input [4:0] shamt;
	output reg [n-1:0] res;
	
	always @(posedge clk)
	begin
		case (func)
		3'b000: res = a + b;
		3'b001: res = a - b;
		3'b010: res = a & b;
		3'b011: res = a | b;
		3'b100: res = a ^ b;
		3'b101: res = b << shamt;
		3'b110: res = b >> shamt;
		3'b111: res = (a < b) ? 1'b1 : 1'b0;
		endcase
	end

endmodule
