	processor	6502
	org	$1000

loop:
	lda #$00
	sta $d020
	clc
	adc #$04
	sta $d021
	asl $d021
	jmp loop