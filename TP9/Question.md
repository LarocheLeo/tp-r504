# 2 Communication en mode UDP

## Q2.1 - Que se passe-t-il si on lance le client sans que le serveur ne soit actif :

    Vu que nous sommes en UDP, les packets ne sont pas tracer. Donc si on lance des packet sans que le serveurs soit actif. On aura rien en retour. 

## Q2.2 - Quel est le numéro de port utilisé :

    On utilise le port 1234.

    Chercher si cela est un choix pertinent. Pourquoi ? : C'est un choix logique et pertinent car le port 1234 est utiliser pour le tcp et udp. 

## Q2.3 - Modifier les deux programmes pour que le serveur renvoie la chaîne reçue au client, et que celui-ci attende cette chaîne et l’affiche avant de quitter.

    Réussi 

# 3 Communication en mode TCP