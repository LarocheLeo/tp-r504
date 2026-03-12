# Miniprojet : Message Brocker / Redis

## 2.1 Execution en local

### Q2.7

Le producer, créer beaucoup de donnée en très peu de temps, cependant cet afflux de données fait en sorte que le consumer soit surmerger par les envoies du producer. 

### Q2.8

Avec un second consumer, on note qu'il y a bien une diminution légère, cependant les deux consumer sont toujours submerger par l'afflux de données. 


## 2.2 Monitoring et auto-adaptation

### Q2.15

Après que test, le nombre maximun de consumer se trouve entre 30 et 35. 

En dessous, la liste augmente. Donc sa créer des consumers.
Et au dessus la liste baisse faisant disparaitres des consumers car il en à trop.

et donc entre les deux valeurs, la liste se stabilise. 

### Q2.16

Le problème principe est sa lenteur. Le programme prend beaucoup de temps pour faire ces cycles et donc augmenter les consumers. Mais aussi c'est le nombre de création de consumer. On à un consumer toutes les 3 secondes ce qui est largement pas assez et permet donc à la liste de se remplire. 
