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

In this file, all lines starting by a semi-colon `;` are commented out and not read by the program.




