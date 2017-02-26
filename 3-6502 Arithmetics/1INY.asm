	processor	6502
	org	$1000

loop:
	ldy #$00
	sty $d020
	iny
	iny
	iny
	iny
	iny
	iny
	iny
	iny
	sty $d021
	jmp loop