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

#### Q4.2 - Le contenu du fichier est-il conforme à ce qui est attendu ? (cf. Cours sur protocole HTTP)

#### Q4.3 - La sortie est-elle constituée uniquement d’un fichier html conforme ? Pourquoi ?

#### Q4.4 - Essayer ensuite avec le site www.javaworld.com Cela fonctionne-t-il correctement ? (comparez avec ce que vous obtenez via un navigateur) Essayez ensuite avec d’autres URLs.

#### Q4.5 - A votre avis, pourquoi obtient-on des résultats différents d’un navigateur ? (relire le cours sur le protocole HTTP)

#### Q4.6 - Analyser la réponse de www.univ-rouen.fr (voir le fichier ur.html) et observez les en-têtes. En comparant avec la page en.wikipedia.org/wiki/List_of_HTTP_header_fields, indiquez ci-dessous les champs renvoyés par le serveur et indiquez leur sens :
