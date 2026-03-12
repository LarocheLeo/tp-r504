# Redis client cheatsheet (A COMPLETER!)

Référernces:
- https://en.wikipedia.org/wiki/Redis
- https://redis.io/
  
## 1 - Commandes généralistes

| Commande |   |
|----|-----|
| PING | PONG (test) |
| DBSIZE | Nombre de clés stockées |
| FLUSHDB | Effacement de toute la BDD courante |
| FLUSHALL | Effacement de toutes les BDD |
| EXISTS | Test de l'existence d'une clé |
| DEL | Suppression d'une clé |
| KEYS | Renvoie toutes les clés lier à un motif |


## 2 - Gestion de valeurs de type "string" (texte ou numérique)

| Commande |   |
|----|-----|
| SET | Donne une valeur à une clé |
| GET | Récupère la valeur d'une clé |
| INCR | Incrémente un compteur (+1) |
| INCRBY | Incrémente un compteur d'une valeur spécifiée |
| DECR | Décrémente un compteur (-1) |
| DECRBY | Décrémente un compteur d'une valeur spécifiée |


## 3 - Gestion de listes

| Commande |   |
|----|-----|
| LLEN | Nb d'éléments dans la liste |
| LPUSH | Ajout d'élements par la gauche |
| RPUSH | Ajout d'élements par la droite |
| LPOP | Dépilement d'une valeur par la gauche |
| RPOP | Dépilement d'une valeur par la droite |
| LINDEX | Lecture d'un élément par son index |
| LRANGE | Lecture de plusieurs éléments par leurs index |
| BLPOP | Dépliment bloquant par la gauche |
| BRPOP | Dépliment bloquant par la droite |

## 4 - Gestion de Hash (collection de paires clé-valeur)

| Commande |   |
|----|-----|
| HLEN | Nb d'éléments |
| HGET | Accès à une valeur |
| HINCRBY | Incrémentation valeur numérique par sa clé |
| HSET | Ajout paire clé/valeur |
| HKEYS | Renvoie la liste des clés |
| HGET | Renvoie une des valeurs par sa clé |
| HVALS | Renvoie la liste des valeurs/clés |
| HGETALL | Renvoie toutes les valeurs/clés |





