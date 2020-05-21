; based on https://csound.com/docs/manual/lorenz.html

<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
;-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
 -o dac7
 -+rtaudio=PortAudio ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

giosc1 OSCinit 5005
giosc2 OSCinit 5006

turnon 1  ; starts instrument 1 immediately

; Instrument #1 - a lorenz system in 3D space.
instr 1
  ; Create a basic tone.
  kcps init 500
  kcps1 init 0
  kcps2 init 0
  kamp init 1000
  kans OSClisten giosc1, "/amp", "f", kcps1
  kans2 OSClisten giosc2, "/amp2", "f", kcps2
  ifn = 1
  asnd oscil kamp, kcps, ifn
  ;asnd2 oscil kamp, kcps*0.996, ifn
  ;asnd3 oscil kamp, kcps*1.004, ifn
  ; Figure out its X, Y, Z coordinates.
  ksv init 10
  ;krv init kcps2
  ;kbv init kcps1
  kh init 0.0003
  ix = 0.6
  iy = 0.6
  iz = 0.6
  iskip = 1
  ax1, ay1, az1 lorenz kcps, kcps1, kcps2, kh, ix, iy, iz, iskip

  ; Place the basic tone within 3D space.
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1
  idist = 1
  ift = 10
  imode = 1
  imdel = 1.018853416
  iovr = 2
  aw2, ax2, ay2, az2 spat3d asnd, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr
  ;aw3, ax3, ay3, az3 spat3d asnd2, kx, ky, kz, idist, \
                            ;ift, imode, imdel, iovr
  ;aw4, ax4, ay4, az4 spat3d asnd3, kx, ky, kz, idist, \
                            ;ift, imode, imdel, iovr
  ; Convert the 3D sound to stereo.
  aleft = aw2 + ay2 ;+ aw3 + ay3 + aw4 + ay4
  aright = aw2 - ay2 ;+ aw3 - ay3 + aw4 - ay4

  outs aleft, aright
endin


</CsInstruments>
<CsScore>

; Table #1 a sine wave.
f 1 0 256 10 1

i 1 0 500
e 40


</CsScore>
</CsoundSynthesizer>