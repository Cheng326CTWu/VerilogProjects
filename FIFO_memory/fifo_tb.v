`timescale 1ns/1ns

module fifo_tb();
reg clk;
reg write, read;
reg [7:0] dataIn;
wire [7:0] dataOut;
wire [1:0] count;
wire full, empty;

fifo DUT(.clk(clk), .write(write), .read(read), .dataIn(dataIn), .dataOut(dataOut), .count(count), .full(full), .empty(empty));

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
	write = 1'b1;
	dataIn = 8'd1;
	
	#100;
	dataIn = 8'd3;

	#100;
	dataIn = 8'd2;

	#100;
	write = 1'b0;
	read = 1'b1;
	
	#300;
	
	
end
endmodule

