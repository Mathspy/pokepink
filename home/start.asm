_Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, TRUE ;gbctest - set the marker for being in gbc mode
.ok
	ld [hGBC], a
	jp Init
