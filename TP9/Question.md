# 2 Communication en mode UDP

## Q2.1 - Que se passe-t-il si on lance le client sans que le serveur ne soit actif :

    Vu que nous sommes en UDP, les packets ne sont pas tracer. Donc si on lance des packet sans que le serveurs soit actif. On aura rien en retour. 

## Q2.2 - Quel est le numéro de port utilisé :

    On utilise le port 1234.

    Chercher si cela est un choix pertinent. Pourquoi ? : C'est un choix logique et pertinent car le port 1234 est utiliser pour le tcp et udp. 

## Q2.3 - Modifier les deux programmes pour que le serveur renvoie la chaîne reçue au client, et que celui-ci attende cette chaîne et l’affiche avant de quitter.

    Réussi 

# 3 Communication en mode TCP

    voir les différents codes

# 4 Client HTTP via socket TCP

## Q4.1 Redirigez la sortie vers un fichier ur.txt via le shell (avec ">"), puis l’ouvrir avec un éditeur texte. Le fonctionnement est-il correct ? 

    On dirait bien que tout fonctionne quand on regarde le fichier ur.txt

## Q4.2 - Le contenu du fichier est-il conforme à ce qui est attendu ? (cf. Cours sur protocole HTTP)

    Celon nos attente oui, le contune du fichier est conforme.

## Q4.3 - La sortie est-elle constituée uniquement d’un fichier html conforme ? Pourquoi ?

    Non, même s'il à bien le fichier html conforme, il y a aussi des en-tête HTTP qui nous donnes des informations suplémentaire comme la data,  le code "302" ici ou ad'autres métadonnées 

## Essayer ensuite avec le site www.javaworld.com Cela fonctionne-t-il correctement ? (comparez avec ce que vous obtenez via un navigateur)Essayez ensuite avec d’autres URLs.

    oui cela fonctionne, si on les compare ce qu'on a obtenue du ClientHTTP au navigateur, le navigateur va bien sur nous donner beaucoup plus de chose.  La navigateur suivra la redirection alors que notre programme le fera seulement si on le programme pour le faire. 

    

## Q4.5 - A votre avis, pourquoi obtient-on des résultats différents d’un navigateur ? (relire le cours sur le protocole HTTP)

    On utilise dans la plus part des cas le verbe HTTP GET mais certains site eux peuvent demander d'autres verbe qu'on utilise pas et donc sa nous affiche des choses différentes

## Q4.6 - Analyser la réponse de www.univ-rouen.fr (voir le fichier ur.html) et observez les en-têtes. En comparant avec la page en. wikipedia.org/wiki/List_of_HTTP_header_fields, indiquez ci-dessous les champs renvoyés par le serveur et indiquez leur sens 

```
    HTTP/1.1 302 Found
    Date: Fri, 18 Oct 2024 12:50:05 GMT
    Server: Apache
    Location: https://www.univ-rouen.fr/
    Content-Length: 210
    Connection: close
    Content-Type: text/html; charset=iso-8859-1
```
    HTTP/1.1 302 Found :    Indique que la ressource demandée a été temporairement déplacée à une autre URL (spécifiée dans l'en-tête Location).
    Date: Fri, 18 Oct 2024 12:50:05 GMT :    Montre la date et l'heure à laquelle la réponse a été générée par le serveur.
    Server: Apache :    Indique le logiciel serveur utilisé pour traiter la requête. Ici, il s'agit d'Apache.
    Location: https://www.univ-rouen.fr/ :    Indique la nouvelle URL vers laquelle le client doit rediriger sa requête. Cela accompagne le code 302, signalant un changement temporaire.
    Content-Length: 210 :    Indique la taille du corps de la réponse en octets. Cela signifie que le contenu de la réponse a une longueur de 210 octets.
    Connection: close :    Indique que la connexion TCP sera fermée après l'envoi de la réponse.
    Content-Type: text/html; charset=iso-8859-1 :    Indique le type de contenu de la réponse. Ici, il s'agit de texte HTML, et le charset utilisé est ISO-8859-1.

