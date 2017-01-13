// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// LISTEN:
// 		@KBD
// 		D=M
//  	if D > 0 goto PAINT
//		goto LISTEN
// PAINT:
//		addr = SCREEN
//		n = 16384
//		i = 0
//		LOOP:
//	 		if 	i > n goto LISTEN
//			RAM[addr] = -1
//			addr = addr + 1
//			goto LOOP
//		goto END
// END:
//	goto LISTEN


	(LISTEN)
		@KBD
		D=M
		@PAINT
		D;JGT
		@LISTEN
		0;JMP

	(PAINT)
		@SCREEN
		D=A

		@addr
		M=D	//addr = 16384

		@8160
		D=A
		@n
		M=D

		@i
		M=0	// i = 0

		(LOOP)
			@i
			D=M
			@n
			D=D-M
			@LISTEN
			D;JGT	// i > n

			@addr
			A=M
			M=-1 // RAM[addr] = -1

			@i
			M=M+1   //i=i+1
			@addr
			M=M+1	//addr=addr+1
			@LOOP
			0;JMP	//goto LOOP

		@LISTEN
		0;JMP


