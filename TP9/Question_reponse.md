# 2 Communication en mode UDP

## Questions

#### Q2.1 - Que se passe-t-il si on lance le client sans que le serveur ne soit actif :

Vu que nous somme avec le protocole UDP, rien ne sera afficher car UDP n'a pas de verification, si oui ou non le paquet est bien arriver à destination. 

#### Q2.2 - Quel est le numéro de port utilisé : Chercher si cela est un choix pertinent. Pourquoi ? :

le port est 1234. Car le port ne fait pas partie des ports systems, et aussi c'est le port par défault pour le RTP et le UDP.

#### Q2.3 - Modifier les deux programmes pour que le serveur renvoie la chaîne reçue au client, et que celui-ci attende cette chaîne et l’affiche avant de quitter.

voir les programmes ClientUDP et ServeurUDP.


# 4 Client HTTP via socket TCP

#### Q4.1 - Vérifiez le fonctionnement en tapant : java Clienthttp www.univ-rouen.fr. Redirigez la sortie vers un fichier ur.txt via le shell (avec ">"), puis l’ouvrir avec un éditeur texte. Le fonctionnement est-il correct ? :

Oui, dans une première partie, on a les infos relatif au serveur, le type de text et autre. puis dans la seconde partie, on à les balise HTML.

#### Q4.2 - Le contenu du fichier est-il conforme à ce qui est attendu ? (cf. Cours sur protocole HTTP)

Bien que cela change un peut, c'est le cas.

#### Q4.3 - La sortie est-elle constituée uniquement d’un fichier html conforme ? Pourquoi ?

Non, on à aussi, les informations lier a HTTP et au serveur. Car le client donc nous à besoin de savoir ce que le serveur lui envoie. 

#### Q4.4 - Essayer ensuite avec le site www.javaworld.com Cela fonctionne-t-il correctement ? (comparez avec ce que vous obtenez via un navigateur) Essayez ensuite avec d’autres URLs.

urls tester : 
www.univ-rouen.com
www.javaworld.com
www.wikipedia.com
www.youtube.com

Javaworld est le seul qui ne fonctionne pas correctement en comparant avec les autres.

#### Q4.5 - A votre avis, pourquoi obtient-on des résultats différents d’un navigateur ? (relire le cours sur le protocole HTTP)

Notre programme demande certaines choses pour récupèrer des informations cependant. Pour certains site, il faut demander des informations précises pour avec les dites informations. Donc si javaworld fonctionne pas correctement, c'est juste qu'on demande pas les bonnes informations.

#### Q4.6 - Analyser la réponse de www.univ-rouen.fr (voir le fichier ur.html) et observez les en-têtes. En comparant avec la page en.wikipedia.org/wiki/List_of_HTTP_header_fields, indiquez ci-dessous les champs renvoyés par le serveur et indiquez leur sens :


```
HTTP/1.1 302 Found 

```
Ce champ informe la version HTTP utiliser, le code de retour 302 (Redirections d'url non permanentes) et si la page était trouver.

```
Date: Tue, 23 Sep 2025 07:46:44 GMT

```
Précise la date et l'heure où le message est envoyer.

```
Server: Apache

```
Indique le nom du serveur. 

```
Location: https://www.univ-rouen.fr/

```
Location est utilsier dans une redirection ou quand une nouvelle ressource est créer. Ici, nous somme dans un cas de redirection.

```
Content-Length: 210

```
Ce champs indique la longueur du corps de la requette en octets.

```
Connection: close

```
C'est un champ de controle pour la connextion actuelle. 

```
Content-Type: text/html; charset=iso-8859-1

```
Le type de media renvoyer dans le corps de la request juste en dessous.

```
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>302 Found</title>
</head><body>
<h1>Found</h1>
<p>The document has moved <a href="https://www.univ-rouen.fr/">here</a>.</p>
</body></html>

```
Le corps de la requette, il est écrit en HTML et donne diverse informations sur le site qu'on demande. Ici, www.univ-rouen.fr.



