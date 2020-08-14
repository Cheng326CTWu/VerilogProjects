module fifo
(
	clk,
	write,
	read,
	dataIn,
	dataOut,
	count,
	full,
	empty
);

	parameter n = 8;
	parameter depth = 1;

	input clk;
	
	input write;
	input [n-1:0] dataIn;
	output reg full;
	output reg [depth:0] count;

	input read;
	output reg [n-1:0] dataOut;
	output reg empty;

	reg [n-1:0] mem [(1<<depth)-1:0];
	reg [depth:0] write_addr, read_addr;

	wire w_write = (write && !full);
	wire w_read = (read && !empty);

	initial
	begin
		write_addr = 0;
		read_addr = 0;
	end

	always @(posedge clk)
	begin
		if(w_write)
		begin
			write_addr <= write_addr + 1'b1;
			mem[write_addr[depth-1:0]] <= dataIn;
		end

		if(w_read)
		begin
			read_addr <= read_addr + 1'b1;
			dataOut = mem[read_addr[depth-1:0]];
		end
	end

	always @(*)
		count = write_addr - read_addr;

	always @(*)
		full = (count == {1'b1, {(depth){1'b1}}});

	always @(*)
		empty = (count == 0);


endmodule
