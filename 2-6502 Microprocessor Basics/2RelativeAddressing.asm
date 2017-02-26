	processor	6502
	org	$1000

loop:
	ldx #$20
	lda #$03
	sta $d000,X
	sta $d001,X
	jmp loop
