	processor	6502
	org	$1000

loop:
	ldy #$03
	sty $d020
	iny
	sty $d021
	jmp loop