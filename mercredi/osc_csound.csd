; adapted from http://floss.booktype.pro/csound/a-open-sound-control/ and https://www.youtube.com/watch?v=JX1C3TqP_9Y

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 128
nchnls = 2
0dbfs = 1

giosc1 OSCinit 5005

turnon 1  ; starts instrument 1000 immediately

instr 1 
kamp init 0
kans OSClisten giosc1, "/amp", "f", kamp

aosc oscil kamp, 440, 1
outs aosc, aosc
endin

</CsInstruments>
<CsScore>

f 1 0 1024 10 1

;i 1 0 3000
e 3600
</CsScore>
</CsoundSynthesizer>