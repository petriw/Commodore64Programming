	processor	6502
	org	$0810

	lda #$00
	tax
	tay
	jsr $1000
	sei
	lda #$7f
	sta $dc0d
	sta $dd0d
	lda #$01
	sta $d01a
	lda #$1b
	ldx #$08
	ldy #$14
	sta $d011
	stx $d016
	sty $d018
	lda #<irq
	ldx #>irq
	ldy #$7e
	sta $0314
	stx $0315
	sty $d012
	lda $dc0d
	lda $dd0d
	asl $d019
	cli
loop:
	jmp loop
irq:
	jsr $1006
	asl $d019
	jmp    $ea81

	org $1000-$7e
	INCBIN "music.sid"