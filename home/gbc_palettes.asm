;gbcnote - new functions
UpdateGBCPal_BGP::
	push af
	ld a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ld a, [rBGP]
	ld b, a
	ld a, [wLastBGP]
	cp b
	jr z, .noChangeInBGP
	callfar _UpdateGBCPal_BGP
.noChangeInBGP
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

UpdateGBCPal_OBP0::
	push af
	ld a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ld a, [rOBP0]
	ld b, a
	ld a, [wLastOBP0]
	cp b
	jr z, .noChangeInOBP0
	ld d, CONVERT_OBP0
	callfar _UpdateGBCPal_OBP
.noChangeInOBP0
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

UpdateGBCPal_OBP1::
	push af
	ld a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ld a, [rOBP1]
	ld b, a
	ld a, [wLastOBP1]
	cp b
	jr z, .noChangeInOBP1
	ld d, CONVERT_OBP1
	callfar _UpdateGBCPal_OBP
.noChangeInOBP1
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret
