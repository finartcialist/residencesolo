; This exercise is to change a single parameter in the oscillator,
; in this case, the frequency - and to experiment with different values for it.


<CsoundSynthesizer>
<CsOptions>
; -odac
</CsOptions>
<CsInstruments>
;===========
; toot01.orc 
;===========

sr		=		44100
kr		=		4410
ksmps 	=		10
nchnls	=		1

		instr 1
a1		oscil	10000, p4, 1
		out		a1
		endin
</CsInstruments>
<CsScore>
;===========
; toot01.sco
;===========

f1	0	4096	10 1		; use GEN10 to compute a sine wave

;ins	strt	dur     freq
i1	0	1 110
i1	1	1 120
i1	2	1 130
i1	3	1 140
i1	4	1 150
i1	5	1 160
i1	6	1 170
i1	7	1 180
i1	8	1 190
i1	9	1 200

e					; indicates the end of the score
</CsScore>
</CsoundSynthesizer>

