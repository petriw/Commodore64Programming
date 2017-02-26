	processor	6502
	org	$1000
	
	lda #$80
	sta $07f8
	lda #$01
	sta $d015
	lda #$80
	sta $d000
	sta $d001

loop:
	jmp loop

	org $2000
	incbin "sprite2.spr"