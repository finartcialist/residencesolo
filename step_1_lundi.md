# Instrument Design TOOTorial

I am going to work through this tutorial: http://www.csounds.com/toots/index.html

*If you are like me and you never thought about sound synthesis formally before reading this introduction, it can be confusing.*

*I remember that understanding how a Csound file is layed out was fairly straightforward, and then I also remember feeling that everything escalated quickly from there. Let's try to take notes of all the little twists that might help a potential reader make sense of this.*

## Introduction

The main working of Csound: like in assembly, one line of Csound can be read as an action followed by a serie of arguments. 

The main parts of a Csound file:
* the orchestra file: it can be further broken down in two pieces, the instruments definitions, and the meta information contained in the header.
* the score file: this is where the notes to be played are defined.


### The Header

With the phrase "A Csound orchestra generates signals at two rates - an audio sample rate and a control sample rate", I remember not knowing anything at all about sound synthesis and information theory - and I was lost about what a rate is and why this information matters.

Basically speaking, we want to take a continuous soundwave and make it discrete, so that a computer can understand it.

If you wish to learn more about this, I feel like this [Wikipedia article about sampling](https://en.wikipedia.org/wiki/Sampling_(signal_processing)) is a good start. 

I do not feel I am the best person to explain all the intricacies of this... let's try nonetheless !

So in the header section, we want to tell Csound two things:

- how often we make blocks of discrete signals (control sample rate)
- how often we sample inside these blocks (audio sample rate)

By dividing the first one by the second one, we get the number of samples that each block will contain.

### The instrument

This is where the instruments are defined.

Let's work through an example.

                instr 1
        a1      oscil   10000, 440, 1
                out     a1
                endin

With the first line, `instr 1`, we are defining an instrument and attributing the number 1 to it; this number will be used to refer to this instrument in the score file.

On the second line, we are generating an oscillator, `oscil`, whose result is stored in the variable `a1`. The numbers are arguments used by `oscil`.

The third line tells us that the stored variable `a1` is the output.

Finally, we tell the program that this is our instrument with `endin`.

### Score file

The score file contains all the information that tells the program which note to play with which instrument, and when to play it.


## Toot 1 : Play One Note

Let's make this more specific with a first example!

Within the Toots.zip folder there are two files, toot01.orc and toot01.sco. We will play them together with the following command line input:

                csound toot01.orc toot01.sco

By default, the output will be saved in a file called `test.wav`.

You can change the name of this file with the flag -o FILE:

                csound toot01.orc toot01.sco -o name_of_file.wav

We can also put the `.orc` and the `.sco` files together in a `.csd` file. This will give us the following code:

        <CsoundSynthesizer>
        <CsOptions>
        ; -odac
        </CsOptions>
        <CsInstruments>
        ;===========
        ; toot01.orc 
        ;===========

        ; define the sample rate
        sr		=		44100
        ; define the control rate
        kr		=		4410
        ; number of samples by blocks
        ksmps 	=		10
        ; number of channels
        nchnls	=		1

        ; first instrument, based on an oscillator
        ; oscil will read the table function 1 (defined as f1 later on: it is a sine wave).
	        	instr 1
        a1		oscil	10000, 440, 1
	        	out		a1
		        endin
        </CsInstruments>
        <CsScore>

        ;===========
        ; toot01.sco
        ;===========

        ; use GEN10 to compute a sine wave
        ; the f1 indicates that this is a function.
        ; more about f statement here: http://www.csounds.com/manual/html/f.html
        ; more info about the GEN10 sine wave here: http://www.csounds.com/manual/html/GEN10.html
        ; this line says: in the table number 1, store the function 10 with the parameter 1, from beat 0 and a size of function table of 4096 points.
        f1	0	4096	10 1		

        ; here we are playing instrument number one, from start `strt`, for a duration `dur`.
        ;ins	strt	dur
        i1	0	4

        ; indicates the end of the score
        e		
        </CsScore>
        </CsoundSynthesizer>			

In this file, all lines starting by a semi-colon `;` are commented out and not read by the program.

## Going further

**Now that this info is layed out, how do we go around exploring the sound making possibilities of Csound, _while not knowing about sound synthesis_?**

Let's learn about this first, and we will come back to Csound proper afterwards !

# Sound synthesis

The broad history is given here: http://write.flossmanuals.net/csound/a-additive-synthesis/

Briefly: Fourier discovers in the 1800s that "any continuous function can be described perfectly as a sum of sine waves". 

Let's go deeper : https://en.wikibooks.org/wiki/Sound_Synthesis_Theory

## Walking through the Ableton Learning Synth tutorial

This tutorial was suggested to me by different people, starting at the [Société des Arts Technologiques](sat.qc.ca) Station Créative workshops.

Here: https://learningsynths.ableton.com/

### Basics features

*Amplitude*: how loud a sound is.

*Pitch*: if a sound is aïgu or grave.

*Brigthness*: still unsure about to best define this, and apparently [I am not alone](https://music.stackexchange.com/questions/81104/what-is-brightness) - although [later comes an explanation](https://learningsynths.ableton.com/en/filters/filters-in-synthesizers)

*Movement*: it feels like the sound is moving - maybe the frequency is higher ? More on this later.

### Envelopes

Let's move on to [envelopes](https://learningsynths.ableton.com/en/envelopes/change-over-time): "most synthesizers have envelopes with four sections or stages, called attack, decay, sustain, and release. You’ll often see these abbreviated as ADSR."

*Attack*: basic, attack is the delay before the envelope reaches its peak, when a note is played. If the delay is long, the sound will evolve slower.

*Decay*: the time is takes for the envelope to get to the sustain level, after reaching its peak.

*Sustain*: the point where nothing changes.

*Release*: the time is takes for the sound to stop after the note has stopped playing. 

You can play with all of these here: https://learningsynths.ableton.com/en/envelopes/putting-the-envelope-together



## Notes on Sound and Music by Ben Lynn

https://crypto.stanford.edu/~blynn/sound/


# Going back to mathematics

Some links:
[John Baez 2006 blog about math of music](http://www.math.ucr.edu/home/baez/week234.html)

[Elements of music, Wikipedia](https://en.wikipedia.org/wiki/Elements_of_music)

[Music and mathematics, Wikipedia](https://en.wikipedia.org/wiki/Music_and_mathematics)

[Lots of resources from the AMS](http://www.ams.org/publicoutreach/math-and-music), including this personal favorite of mine, [The Geometry of Music by Tymoczko](https://www.youtube.com/watch?v=2A4Tt62pWaI).



