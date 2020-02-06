module LCDController(
	inStart,inRS,inDATA,clk,rst_n,outDone,LCD_DATA,LCD_EN,LCD_RS,LCD_RW
);
input [7:0]	inDATA;
input 		inStart;
input 		inRS;
input 		clk,rst_n;

output reg 	outDone;
output [7:0]LCD_DATA;
output reg 	LCD_EN;
output 		LCD_RS;
output 		LCD_RW;

reg [1:0]state;
reg [4:0]count_250ns;
reg 		preStart,start;

assign LCD_DATA=inDATA;
assign LCD_RW	=1'b0;
assign LCD_RS	=inRS;

parameter t_250ns = 16; //When LCD_EN is change state, delay at least 250ns

always@(posedge clk,negedge rst_n) begin
	if(!rst_n) begin
		outDone		<=1'b0;
		LCD_EN		<=1'b0;
		count_250ns	<=1'b0;
		preStart		<=1'b0;
		start			<=1'b0;
		state			<=1'b0;
	end
	else begin
		preStart<=inStart;
		if({preStart,inStart}==2'b01) begin
			start					<=1'b1;
			outDone				<=1'b0;
		end
		if(start==1'b1) begin
			case(state)
			2'b00:state			<=2'b01;	//wait 10ns for hold LCD_DATA
			2'b01:begin
				LCD_EN			<=1'b1;
				state				<=2'b10;
			end
			2'b10:begin
				if(count_250ns<t_250ns)
					count_250ns	<=count_250ns+1'b1;
				else
					state			<=2'b11;
			end
			2'b11:begin
				LCD_EN			<=1'b0;
				count_250ns		<=1'b0;
				state				<=2'b00;
				outDone			<=1'b1;
				start				<=1'b0;
			end	
			endcase
		end
	end
end
endmodule