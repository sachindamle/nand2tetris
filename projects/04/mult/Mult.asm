// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// m = R0
// n = R1
// for (i = 1; i > n; i++) {
//		m = m + n
// }
//
// m = R0
// n = R1
// i = 0
// R2 = 0
// LOOP:
//		if i > n goto END
//		R2 = R2 + m
//		i = i +1
//		goto LOOP
// END:
//		goto END

	//m=R0
	@R0
	D=M
	@m
	M=D

	//n=R1
	@R1
	D=M
	@n
	M=D

	//i=1
	@1
	D=A
	@i
	M=D

	//R2=0
	@0
	D=A
	@R2
	M=D

	//LOOP
	(LOOP)
		@i
		D=M
		@n
		D=D-M
		@END
		D;JGT //i > n

		@m
		D=M
		@R2
		M=D+M //R2=R2+m

		@i
		M=M+1 //i=i+1

		@LOOP
		0;JMP //goto LOOP

	(END)
		@END
		0;JMP
