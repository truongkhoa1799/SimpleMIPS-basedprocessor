/*module Division(out, dividend, divisor);
	output [31:0]out;
	input [31:0]divisor, dividend;
	
	wire [31:0]divisor_c, dividend_c, out_c;
	reg [31:0]temp, divide, divisor_temp, divisor_temp_c, dividend_temp;
	
	Two_Complement m1(divisor_c, divisor);
	Two_Complement m2(dividend_c, dividend);

	integer i;
	always @(divisor or dividend)
		begin
			temp = 32'd0;
			divide = 32'd0;
			divisor_temp = (divisor[31] == 1) ? divisor_c : divisor;
			divisor_temp_c = (divisor[31] == 1) ? divisor : divisor_c;
			dividend_temp = (dividend[31] == 1) ? dividend_c : dividend;
			for (i = 31; i >= 0; i = i - 1)
				begin
						temp = {temp[30:0], dividend_temp[i]};
					if (temp < divisor_temp)
						divide = {divide[30:0], 1'b0};
					else 
						begin
							divide = {divide[30:0], 1'b1};	
							temp = temp + divisor_temp_c;
						end
				end
		end
	
	Two_Complement m3(out_c, divide);

	assign out = 	(divisor[31] == 1 && dividend[31]) ? divide : 
						(divisor[31] == 1 || dividend[31]) ? out_c : divide;

endmodule*/
