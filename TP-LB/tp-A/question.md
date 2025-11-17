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

### Q2.5 - Écrire une boucle bash qui va faire 500 appels à "localhost" sur le port 83 avec l’outil "curl" et vérifier que vous avez alternativement la réponse des deux serveurs.

boucle_bash.sh 

### Q2.6 - Proposer (et implémenter) une solution pour compter les réponses de chaque serveur et vérifier : la répartition est-elle 50/50 ?

boucle_bash.sh

### Q2.7 - Modifier la configuration de nginx pour affecter un poids de 75% à celui sur le port 81 et 25% à l’autre. Relancer l’ensemble et vérifier avec le script précédent que ça fonctionne

```
upstream loadbalancer {
		server nginx1:80 weight=7;
		server nginx2:80 weight=3;

```

## 3 Load balancing via Docker Compose
## 3.1 Construction du "stack" avec deux applications Python
### Q3.1 - Dans le dossier TP-LB, créer un sous-dossier tp-B et créer l’arborescence suivante :

script : crea_arbo_tp-B 
au lieu de le faire a la main. 

### Q3.2 - Créer les deux fichiers app.py dans les dossiers app1 et app2 (remplacer le texte "serveur 1" par "serveur 2" dans le fichier app2/app.py)
### Q3.3 à Q3.8 réussi 
## 3.2 Simplification de la construction

réussi 

## 3.3 "Scaling" des services dans docker compose

reussi : 

```
i25-laroc@IUTR-25-69a2:~/tp-r504/TP-LB/tp-B$ docker ps 
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                           NAMES
dccc58691950   tp-c-app       "python3 app.py"         17 seconds ago   Up 15 seconds   0.0.0.0:32773->5000/tcp, [::]:32773->5000/tcp   tp-c-app-4
87ed850193c9   tp-c-app       "python3 app.py"         17 seconds ago   Up 15 seconds   0.0.0.0:32774->5000/tcp, [::]:32774->5000/tcp   tp-c-app-2
e6fc114f4a52   tp-c-app       "python3 app.py"         17 seconds ago   Up 15 seconds   0.0.0.0:32775->5000/tcp, [::]:32775->5000/tcp   tp-c-app-1
1a359ef9866b   tp-c-app       "python3 app.py"         17 seconds ago   Up 15 seconds   0.0.0.0:32776->5000/tcp, [::]:32776->5000/tcp   tp-c-app-3
507c9b1d0eaf   tp-c-app       "python3 app.py"         17 seconds ago   Up 15 seconds   0.0.0.0:32777->5000/tcp, [::]:32777->5000/tcp   tp-c-app-5
38316246994e   nginx:latest   "/docker-entrypoint.…"   17 seconds ago   Up 15 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp         tp-c-s-nginx-1

```

