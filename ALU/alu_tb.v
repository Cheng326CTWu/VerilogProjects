`timescale 1ns/1ns

module alu_tb();
reg clk;
reg [31:0] a, b;
reg [2:0] func;
reg [4:0] shamt;
wire [31:0] res;

alu DUT(.clk(clk), .a(a), .b(b), .func(func), .shamt(shamt), .res(res));

initial
begin
	clk = 1'b0;
	forever
	begin
		#50;
		clk = ~clk;
	end
end

initial
begin
	a = 32'd3;
	b = 32'd2;
	func = 3'b000;
	shamt = 5'd0;

	#100;
	func = 3'b001;
	shamt = 5'd0;

	#100;
	func = 3'b010;
	shamt = 5'd0;

	#100; 
	a = 32'd4;
	b = 32'd3;
	func = 3'b011;
	shamt = 5'd0;
	
	#100;
	a = 32'd2;
	b = 32'd3;
	func = 3'b100;
	shamt = 5'd0;

	#100;
	b = 32'd1;
	func = 3'b101;
	shamt = 5'd1;

	#100;
	b = 32'd2;
	func = 3'b110;
	shamt = 5'd1;

	#100;
	a = 32'd2;
	b = 32'd3;
	func = 3'b111;
	shamt = 5'd0;

end
endmodule
