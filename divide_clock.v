module divide_clock(clk_in,clk_out);

	input clk_in;
	
	output reg clk_out;
	
	initial clk_out=0;
	
	reg [25:0]count=1;
	
	//divide clock 50MHz to 1Hz
	always@(posedge clk_in) begin
		count<=count+1'b1;
		if(count==250) begin
			clk_out<=~clk_out;
			count<=26'd1;
		end
	end

endmodule