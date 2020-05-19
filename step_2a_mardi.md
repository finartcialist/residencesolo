*mardi 19 mai 2020*

# Tutoriel de Csound

Continuons le tutoriel de Csound : http://www.csounds.com/toots/index.html

## TOOT 2 - P-Fields

C'est la technique que j'utilise le plus avec finartcialist: inclure des données supplémentaires dans le score, qui seront ensuite interprétées par l'instrument.

Je vois ça comme si on avait plus d'une main pour jouer d'un instrument...

## Toot 3 - Envelopes

Je sais que les envelopes ont un rôle important dans les synthétiseurs, mais l'example donné dans le tutoriel ne me parle pas particulièrement... je pense que les explications d'Ableton (voir les liens d'hier sur le Attack, Decay, Sustain, Release) sont plus claires :)

Une autre approche est celle de [Landr](https://blog.landr.com/adsr-envelopes-infographic/).

On peut rouler l'exemple du manuel avec:
        csound toot03.sco toot03.orc

## Toot 4 - Chorusing

Ici, on fait principalement deux choses:

* on utilise les notes plutôt que la fréquence
* on a trois oscillateurs, un peu déphasés, qui joueront les mêmes notes mais différement

On peut rouler l'exemple du manuel avec:
        csound toot04.sco toot04.orc

## Toot 5 - Vibrato

Maintenant, on veut faire un vibrato - comme si le son vibrait.

On ajoute trois variables à notre score:

* p8=vib rate
* p9=vib depth
* p10=vib delay (0-1)

Ces trois variables vont nous permettre de construire le vibrato.

La première, p8, est tuilisée par notre oscillateur principal, k2, comme rate.

La deuxième, p9, est utilisée par un lien segment generator, linseg. Ce générateur contrôle le delay.

Enfin, p10 sert à calcule le delay initial.

Je trouve que ce code est un peu plus délicat: il y a beaucoup d'interactions entre les différentes parties de l'instrument...

On peut rouler l'exemple du manuel avec:
        csound toot05.sco toot05.orc

**Des fois je trouve que les partitions musicales sont un mapping de 5-6 dimensions vers un univers à 2 dimensions, d'où la complexité !**

# Attracteur de Lorenz

J'aimerais arriver à une meilleure compréhension du rôle des différentes composantes de l'attracteur de Lorenz.

Allons-y: https://fr.wikipedia.org/wiki/Syst%C3%A8me_dynamique_de_Lorenz

Premièrement, note de bas de page importante:

« Notre second exemple sera fort analogue au premier et nous l’emprunterons à la météorologie. Pourquoi les météorologistes ont-ils tant de peine à prédire le temps avec quelque certitude ? Pourquoi les chutes de pluie, les tempêtes elles-mêmes nous semblent-elles arriver au hasard, de sorte que bien des gens trouvent tout naturel de prier pour avoir la pluie ou le beau temps, alors qu’ils jugeraient ridicule de demander une éclipse par une prière ? Nous voyons que les grandes perturbations se produisent généralement dans les régions où l’atmosphère est en équilibre instable. Les météorologistes voient bien que cet équilibre est instable, qu’un cyclone va naître quelque part ; mais où, ils sont hors d’état de le dire ; un dixième de degré en plus ou en moins en un point quelconque, le cyclone éclate ici et non pas là, et il étend ses ravages sur des contrées qu’il aurait épargnées. Si on avait connu ce dixième de degré, on aurait pu le savoir d’avance, mais les observations n’étaient ni assez serrées, ni assez précises, et c’est pour cela que tout semble dû à l’intervention du hasard. Ici encore nous retrouvons le même contraste entre une cause minime, inappréciable pour l’observateur, et des effets considérables, qui sont quelquefois d’épouvantables désastres. » **Henri Poincaré**, Science et Méthode, Flammarion, 1908. ( d'ailleurs le livre est disponible en PDF, selon la page wiki du livre : https://fr.wikipedia.org/wiki/Science_et_M%C3%A9thode)

L'impact de cette découverte étant généralement attribuée à Lorenz, continuons.

(je pense que je vais bientôt me pencher sur la théorie des catastrophes appliquée au son : https://fr.wikipedia.org/wiki/Th%C3%A9orie_des_catastrophes, https://hal.archives-ouvertes.fr/hal-00770209/document)

(pause pour écouter Éliane Radigue, https://fr.wikipedia.org/wiki/%C3%89liane_Radigue)


**Revenons à l'attracteur de Lorenz**

Première question: quel est le domaine possible pour chaque variable ?

Grâce à la technologie, on a une façon de jouer avec cet attracteur : http://experiences.math.cnrs.fr/Modele-de-Lorenz.html

"L’«attracteur  de  Lorenz»est  le  paradigme  du  chaos  comme  le  verbe «aimer»e st le paradigme des verbes du premier groupe. Apprendre la conjugaison du verbe  aimer  ne  suffit  pas  pour  apprendre  le  français  mais  c’est  sans  aucun  doute nécessaire." (http://www.bourbaphy.fr/ghys.pdf, une excellent discussion sur l'attracteur et la théorie du chaos, séminaire Poincaré)

Also, now that we are speaking of mathematics, I couldn't help but think about [music on torus](https://plus.maths.org/content/bach-and-musical-torus).

le mot du jour: lévogyre  (tourne à gauche)

(now I miss doing mathematics)

OK so apparently, le domaine n'est pas borné...! donc le mapping ne sera pas évident... ou est-ce le contraire ?

Hmmm... et si on essayait un chorus de Lorenz ?

Allons-y !

# Essai: Chorus de Lorenz

On va commencer par le code du manuel : https://csound.com/docs/manual/lorenz.html

Ensuite, on va ajouter le choeur.

Done: voir lorenz_data_sonification_chorus.csd


# mouvement brownien

Le mouvement brownien m'intéresse car il est utile dans les modèles financiers ET dans la musique.

Voyons voir si quelque chose de similaire est déjà dans Csound...

Bon déjà il y a ça : https://github.com/PasqualeMainolfi/AlgorithmiComposition mais la license ne me permet pas de l'utiliser...

Il y a les fractales : http://www.csounds.com/manual/html/fractalnoise.html

Bien sûr, il y a le noise : http://www.csounds.com/manual/html/noise.html

Il y a une pléthore de noise en fait : http://www.csounds.com/manual/html/SiggenNoise.html

En fait je pense que ceci est inspirant : 
http://www.csounds.com/manual/html/gauss.html

Écoutons.

échec: l'exemple ne semble rien donner...

bon, disons... revenons-y plus tard, je veux continuer mes explorations et surtout, continuer mes expérimentations avec l'attracteur de Lorenz !

# pause: data sonification

https://en.wikipedia.org/wiki/Data_sonification

https://www.youtube.com/watch?v=3EXvR1shVFQ

https://www.ft.com/content/80269930-40c3-11e9-b896-fe36ec32aece

( more on this one here https://www.oreilly.com/radar/data-sonification-making-music-from-the-yield-curve/)

i am not sure how i feel about the words data sonification as it relates to sound art...

they are both "the same" and also quite different...!

also listening to this : https://peterkirn.bandcamp.com/album/splintered-cycles

## the thing about data sonification vs sound art

when i first started finartcialist (a project that was born without a name), i did not know that what I was doing had a name. I was just calling it generative music... it is still not clear to me if it was generative music or not.

Back in 2014, I saw an exhibit at Musée d'art Contemporain de Montréal, which included a piece of work by Richard Ibghy and Marilou Lemmens, called [The Prophets](http://www.ibghylemmens.com/The_Prophets.html). I was studying economics after doing mathematics, and I was in awe at the beautiful, critical art piece I was looking at.

This feeling stayed with me as I started my M.Sc. in financial engineering.

At some point, during a Simulation Monte Carlo homework (I think it was the homework about developing a model related to mortgage-backed securities), I was inspired to create a sonification for the algorithm I was using.

I started to generate sound in MIDI, in Matlab, and soon evolved to using libsndfile in C, directly. The result was pretty brutal, and I was just realizing how much I had to learn about sound synthesis...

I still got some algorithmic music out, as I was calling it - although again, it is not exactly that either...

I was on the fence about how to call what I was making. I didn't know the right terminology - it was definitely experimental music, although it was barely music - it  was just notes that sounded either too random, or too specific. Plus my process was extremely simple, basic one might say...

I remember spending time searching for ways to make music - by remixing Chopin, e.g. - before giving up for a while... and before discovering Csound.

So my story of discovering Csound - at first I knew I could do what I wanted to do with it, in a way that is more user friendly than using libsndfile in C directly - but I had to learn it. And all the docs I was able to find did not make sense to me - it had all these words I knew nothing about. I mean, I did not know where to look up this information ! Besides Wikipedia, of course.

So time went by... I finished my master, started working and had no time for this.

A year or so ago, I decided to go back to this project - and now here I am.

So for me data sonification is more about the academic process - it is about using sound to make sense out of data, to gain a feeling for what is happening in the data. For me, data sonification is less about the artistic result you get, and more about how relevant your sonification is to analytics.

Sound art is more about sound itself, less about the process, or sometimes it is the process too - conceptual sound art I guess ?

I always feel loss when trying to describe what I do... and everything is still unfolding... so yeah, that's it for now. Let's get back to work.


# lévy pdf



# résumé histoire finartcialist

# notes sur la création d'instruments








