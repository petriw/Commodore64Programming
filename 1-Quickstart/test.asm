	processor	6502
	org	$1000

loop:
	inc $d021
	jmp loop
