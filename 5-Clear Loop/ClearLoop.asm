	processor	6502
	org	$1000

	lda #$00
	sta $d020
	sta $d021
	tax
	lda #$20

loop:
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	dex
	bne loop