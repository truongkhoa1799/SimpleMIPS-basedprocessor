module Instruction_Mem(PC,instruction);

	input [31:0]PC;
	output [31:0]instruction;
	wire [14:0]PC_temp=PC[16:2];
	reg [31:0]instruction_mem[0:14];
	initial begin //initial instructions
		/*instruction_mem[0]<= 32'b00000010001100100100000000100000; // add $t0, $s1 , $s2 
		instruction_mem[1]<= 32'b00000010001100100100000000100010; // sub $t0, $s1 , $s2 	
		instruction_mem[2]<= 32'b00000010001100100100000000100100; // and $t0, $s1 , $s2 	
		instruction_mem[3]<= 32'b00000010001100100100000000100101; // or $t0, $s1 , $s2 		
		instruction_mem[4]<= 32'b10001110010010000000000000000110; // lw $t0, 6($s2)
		instruction_mem[5]<= 32'b10101110001101010000000000100111; // sw $s5, 39 ($s1)
		instruction_mem[6]<= 32'b10001110011010110000000000100101; // lw $t3, 37($s3)
		instruction_mem[7]<= 32'b00100010001100100000000000001111; // addi $s2, $s1 ,15
		instruction_mem[8]<= 32'b00000010000100010110100000101010; // slt $t5, $s0, $s1
		instruction_mem[9]<= 32'b00010010001100101111111111110110; // beq $s1, $s2, instruction 1
		instruction_mem[10]<=32'b00001000000000000000000000001101; // jump to ins 14
		instruction_mem[11]<=32'b00000010001100100100000000100000; // add $t0, $s1 , $s2 
		instruction_mem[12]<=32'b00000010001100100100000000100010; // sub $t0, $s1 , $s2 
		instruction_mem[13]<=32'b00010010001100011111111111110010; // beq $s1, $s1, instruction 1
				

		instruction_mem[14]<=32'b00000010001100100111100000010010; // mul $t0, $s1, $s2
*/
		instruction_mem[0]<= 32'b00000010001100100100000000100000; // add $t0, $s1 , $s2 t0=3
		instruction_mem[1]<= 32'b00000001000100100100100000100010; // sub $t1, $t0 , $s2 t1=1 
		instruction_mem[2]<= 32'b00000010001100100100000000100100; // and $t0, $s1 , $s2 	
		instruction_mem[3]<= 32'b00000010001100100100000000100101; // or $t0, $s1 , $s2 		
		instruction_mem[4]<= 32'b10001110010010000000000000000110; // lw $t0, 6($s2)
		instruction_mem[5]<= 32'b10101110001101010000000000100111; // sw $s5, 39 ($s1)
		instruction_mem[6]<= 32'b10001110011010110000000000100101; // lw $t3, 37($s3)
		instruction_mem[7]<= 32'b00100010001100100000000000001111; // addi $s2, $s1 ,15
		instruction_mem[8]<= 32'b00000010000100010110100000101010; // slt $t5, $s0, $s1
		instruction_mem[9]<= 32'b00010010001100101111111111110110; // beq $s1, $s2, instruction 1
		instruction_mem[10]<=32'b00001000000000000000000000001101; // jump to ins 14
		instruction_mem[11]<=32'b00000010001100100100000000100000; // add $t0, $s1 , $s2 
		instruction_mem[12]<=32'b00000010001100100100000000100010; // sub $t0, $s1 , $s2 
		instruction_mem[13]<=32'b00000010011100100111100000010010; // mul $t0, $s3, $s2
		instruction_mem[14]<=32'b00010010001100011111111111110010; // beq $s1, $s1, instruction 1
	end
	assign instruction=instruction_mem[PC_temp];

endmodule



