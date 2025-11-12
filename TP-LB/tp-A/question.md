# TP: Mise en place d’un "Load Balancing"

## 2 Load balancing via des conteneurs "bruts"
### Q2.3 - Exécuter ce script, et vérifier le bon fonctionnement en se connectant sur les 3 ports mentionnés
### - a : avec un navigateur
nginx1 : ok 
nginx2 : ok
nginx-lb : seulement hello1 apparait

### - b : via une requete utilisant curl

tout fonctionen bien. bien que nginx-lb a fait montrer seulement hello1 au début. 

### Pourquoi le "load-balancing" ne semble pas fonctionner avec un navigateur, alors qu’on voit bien le fonctionnement avec curl ?

avec curl, on créer une nouvelle connexion à chaque fois. 
alors que sur navigateur, on ne le fait pas a cause du cache. 

### Q2.4 - Ecrire un script stop.sh qui va arreter les 3 conteneurs (et les supprimer si vous n’avez pas précisé l’option --rm au lancement) et supprimer le réseau précédemment crée
