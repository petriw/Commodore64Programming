	processor	6502
	org	$1000

loop:
	lda #$08
	sta $d020
	sec
	sbc #$08
	sta $d021
	jmp loop