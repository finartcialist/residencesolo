; let's try to add a simple envelope, based on http://write.flossmanuals.net/csound/a-envelopes/

; we added the line to the instr 1, that goes from 10000 to 0, in p3 duration.
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
aEnv    line    10000, p3, 0      ; amplitude envelope
a1		oscil	aEnv, p4, 1
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

