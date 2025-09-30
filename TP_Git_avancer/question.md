# TP: utilisation avancée de Git
## Analyse d’un dépot

### Q1.1 - Combien y a-t-il de contributeurs ? (d’après Github)

10 

### Clonez le projet dans votre "home" (avec le protocole https), en mesurant le temps :

moins de 1 seconde. 

real	0m0.681s
user	0m0.087s
sys		0m0.066s

### En utilisant du, quelle place occupe-t-il sur le disque ?

420 ko

### Lancer la commande git blame sur le fichier index.html, En vous aidant de git help blame, expliquer en une phrase à quoi sert cette commande :

Elle permet de voir la dernière revision et sont autheur sur un fichier

### Qui a commité la ligne 329 :

Jake Ginnivan

### Notez le hash de ce commit :

3e5d1596

### Avec la commande git show sur ce commit, notez le message de l’auteur du commit :

Adding tag command reference


### Date de ce commit :  

Tue Jun 17 21:47:47 2014 +0100



### En vous aidant de la commande git log <tag>, donner le hash du commit correspondant au tag de la version 1.0.0

294c63b9653d93caefdd233da52fc0cd6ca95268 

### Avec git show, qui est l’auteur de ce commit ?

Wei Wang

### Date ? 

Tue Jan 6 17:14:04 2015 -0500


### Donner la commande bash qui va vous donner le nombre total de commits (et utilisant l’option --oneline de "git log") :

git log --oneline | wc -l

### et le résultat :

93

### La commande "git log" dispose de l’option "format" qui permet de personnaliser l’affichage du
### resultat. Un certain nombre de formats types sont prédéfinis, par exemple essayer :
### $ git log --format=reference
### qui est assez similaire à : $ git log --oneline
### Quelle est la différence ?

git log --format=reference donne seulement le hash, le message et la date du commit 
git log --oneline donne le hash, le message commit, les branches et les tags

### On peut dans ces formats utiliser des "codes de formats" permettant d’avoir exactement l’information désirée, via la syntaxe $ git log --format="XXXX" en placant entre les guillemets des "placeholders".
### Chercher sur la page précédente la chaine à mettre pour avoir uniquement le nom de l’auteur du commit : 

git log --format="%an"


### Via cette dernière commande, et les outils sort, uniq et wc, donner la commande de type "oneliner" qui va afficher le nombre de contributeurs dans ce dépot. Cela correspond-il à ce qui est affiché par Github ?

git log --format="%an" | sort | uniq | wc -l
on en compte 11. 

## Création de branches

### Ouvrez un shell dans votre "repo" tp-r504 et vérifier que tout est "propre". Quelle est la commande à utiliser ?

git status

### Quel est le nom de la branche par défaut ?

origin/main
 
###Le fichier web/index.html est-il versionné ?

oui

### Ajouter ce fichier au dépot, et committer. Puis revenir à la branche principale.Pouvez-vous voir votre fichier index.html 

sur la branche main, on ne peut pas voir.

### Revenir sur la branche tp2 et ajouter une image sur votre page web. Une fois la modification faite, tapez $ git diff. Qu’est-ce que cette commande affiche ?

On vois ce qui était rajouter ou retirer au fichier local par rapport au ficher sur github

###
###
###
###
###
###
###
###
###
###
###
