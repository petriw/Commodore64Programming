	processor	6502
	org	$1000

	jsr $e544
	lda #$0d
	sta $d020
	lda #$05
	sta $d021
	lda #$18
	sta $d018
	ldx #$00

write:
	lda    msg,x
	jsr    $ffd2
	inx
	cpx    #54
	bne    write
	ldx #$00

setcolor:
	lda #$07
	sta $d800,x
	inx
	cpx #$54
	bne setcolor

loop:
	jmp loop

msg: .byte "C64 programming tutorial by digitalerr0r of Dark Codex"

	org	$1ffe
	INCBIN	"scrap_writer_iii_17.64c"