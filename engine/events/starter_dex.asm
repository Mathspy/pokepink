; this function temporarily makes the starters owned so that the
; full Pokedex information gets displayed in Oak's lab
StarterDex:
	; In the original version there was only one load to wPokedexOwned
	; but because the starters we want to use are in two seprate bytes
	; of flag array wPokedexOwned, we have to do two different loads
	; for each byte. We also no longer mark Ivysaur as owned because
	; that was unintentional in the original version and has no value
	;
	; future readers note:
	; It just so happens that Jigglypuff and Vulpix live in the same
	; byte, if your 3 starters live in 3 different bytes you will need
	; a total of 6 loads, 3 for the constants and 3 for A register to
	; memory
	ld a, 1 << ((DEX_JIGGLYPUFF - 1) % 8) | 1 << ((DEX_VULPIX - 1) % 8)
	ld [wPokedexOwned + (DEX_JIGGLYPUFF - 1) / 8], a
	ld a, 1 << ((DEX_POLIWAG - 1) % 8)
	ld [wPokedexOwned + (DEX_POLIWAG - 1) / 8], a
	predef ShowPokedexData
	; This following line is equivalent to xor a, a
	;
	; explaination:
	; xor A register with itself which always zeros it, but costs
	; 1 byte and 1 cycle instead of 2 and 2 if we were to load with a
	; constant, zero in this case
	xor a
	; zero the bytes we originally set as owned
	;
	; future readers note:
	; It just so happens that Jigglypuff and Vulpix live in the same
	; byte, if your 3 starters live in 3 different bytes you will need
	; a total of 3 loads, 1 for each byte
	ld [wPokedexOwned + (DEX_POLIWAG - 1) / 8], a
	ld [wPokedexOwned + (DEX_JIGGLYPUFF - 1) / 8], a
	ret
