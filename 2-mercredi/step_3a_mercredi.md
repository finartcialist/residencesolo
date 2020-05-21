# troisième journée: Csound for real time sound synthesis

*explorations en développement logiciel*

on va laisser un peu de côté la création d'instrument pour aujourd'hui, et on va se lancer dans la partie deux de la résidence: faire rouler le processus de création sur des données live...

pour le moment, j'ai l'impression que la meilleure façon de faire cela sera de connecter csound à python par le biais de OSC, comme je l'ai fait durant l'atelier de [data sonification de Valery Vermeulen](https://www.valeryvermeulen.net/workshops/musicdeepspace/), mais peut-être que je me trompe.

commençons par lire sur le real time avec Csound.

## real time Csound : lectures

une partie de ma réponse se joue ici je pense, mais pour le moment, je n'arrive pas à faire jouer quoique ce soit en real time : http://www.csounds.com/manual/html/UsingRealTime.html

ensuite : http://floss.booktype.pro/csound/f-live-events/ parle d'OSC et semble bien pertinent, mais un peu opaque pour le moment, pour moi.

ensuite 2: http://floss.booktype.pro/csound/d-live-audio/ avec un avertissement bien souligné: 

        Csound Can Produce Extreme Dynamic Range!

        Csound can produce extreme dynamic range, so keep an eye on the level you are sending to your output. The number which describes the level of 0 dB, can be set in Csound by the 0dbfs assignment in the <CsInstruments> header. There is no limitation, if you set 0dbfs = 1 and send a value of 32000, **this can damage your ears and speakers!**

on se rapproche avec http://iainmccurdy.org/csound.html#Arduino

et enfin, je pense avoir trouvé avec : http://www.csounds.com/manual/html/OSCinit.html et les explications: http://floss.booktype.pro/csound/a-open-sound-control/

## osc et python

https://pypi.org/project/python-osc/


## autres ressources

http://csoundjournal.com/issue23/RealtimeSystems1.html

## conclusion temporaire

étapes à suivre:
- connecter mon script python sur une source de données live, en lign (à trouver)
- faire le data processing dans python, et outputer les résultats avec python-osc
- connecter osc dans csound, et donner l'info aux instruments et au score
- bingo ?

hopefully this will works ! let's do it.

# Trouver une source de données

essayons avec https://www.quandl.com/tools/python

it works !

question de pas ruiner l'API, on va utiliser le CSV pour le développement.

## pause, 10h42: échecs et boule de gomme

mais, à 10h56: ÇA FONCTIONNE

si vous faites rouler le fichier `python_server.py` dans un terminal, et ensuite, dans un second terminal, vous exécutez le fichier `python_osc_last_try.py`: ça va fonctionner, vous allez voir les données s'afficher dans le premier terminal ! hourra !


## maintenant: OSC dans Csound

fonctionne pas :'(

moment pour une pause.