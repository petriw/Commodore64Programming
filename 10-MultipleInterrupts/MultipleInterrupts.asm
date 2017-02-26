	processor	6502
	org	$0810

	; initiate music
	lda #$00
	tax
	tay
	jsr $1000

	;clear screen
	jsr $e544

	; disable interrupts
	sei
	lda #$7f
	sta $dc0d
	sta $dd0d
	lda #$01
	sta $d01a

	; set text mode
	lda #$1b
	ldx #$08
	ldy #$14
	sta $d011
	stx $d016
	sty $d018

	; init irq
	lda #<irq
	ldx #>irq
	sta $0314
	stx $0315

	; create rater interrupt at line 0
	ldy #$00
	sty $d012

	; clear interrupts and ACK irq
	lda $dc0d
	lda $dd0d
	asl $d019
	cli

loop:
	jmp loop

irq:
	lda #$04
	sta $d020
	sta $d021

	jsr $1006

	lda #<irq2
	ldx #>irq2
	sta $0314
	stx $0315

	; Create raster interrupt at line 160
	ldy #160
	sty $d012

	asl $d019
	jmp $ea81

irq2:
	lda #$05
	sta $d020
	sta $d021

	lda #<irq
	ldx #>irq
	sta $0314
	stx $0315

	ldy #$00
	sty $d012

	asl $d019
	jmp $ea81

	org $1000-$7e
	INCBIN "music.sid"