# TP 5: Installation et utilisation de Vagrant
## 1 Préparation de la machine hôte
### Q1.1 - Pour pouvoir utiliser KVM/QEMU et libvirt, installer les paquets suivants : qemu-kvm, libvirt-daemon-system
### Q1.2 - Vérifier que libvirt est fonctionnel avec : $ sudo systemctl status libvirtd
bien activer 

### Q1.3 - Verifier que kvm est bien installé avec $ kvm --version et noter la version :
QEMU emulator version 8.2.2 (Debian 1:8.2.2+ds-0ubuntu1.10)
Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers

### Q1.5 - Installer le paquet cpu-checker qui installe la commande kvm-ok. Cette commande permet de vérifier que le CPU autorise la virtualisation. L’exécuter (avec "sudo") et vérifier que c’est le cas, vous devez voir :
```
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5$ sudo kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```

### 1.7 - Afin de pouvoir controler ces outils par l’utilisateur courant (sans passer par "sudo"), il est nécessaire d’ajouter ce dernier au groupe libvirt. Donner la commande permettant de vérifier que ce groupe existe :

less /etc/group 

### Q1.8 - Donner la commande pour faire cet ajout
j'ai juste fait les installation des différents paquet. Le groupe ma rajouter tout seul. 
libvirt:x:127:adminsk,etud,fa25-kifle,fi25-laroc
mais la commande a utiliser normalement est :

sudo usermod -aG libvirt fi25-laroc

### Q1.9 - Installer ensuite Vagrant via le paquet correspondant, et noter la version installée
commande a faire 
```
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install vagrant
```
Vagrant 2.4.9


### Q2.1 - Chercher sur https://app.vagrantup.com/boxes/search une image d’une distribution Debian 11, et noter son nom.


debian/bullseye64



### Q2.2 - N’importe qui pouvant déposer des images sur le "repo", il y a risque avec les "box" téléchargées : il n’est pas impossible de récupérer une image avec des failles de sécurité, ou même des images "malicieuses" A partir de cette page : https://developer.hashicorp.com/vagrant/vagrant-cloud/boxes/catalog donner les éléments à prendre en compte lors du choix d’une image.

- le nom : si dans le nom; il y a bento ou ubuntu. on peut faire plus confiance qu'un user anonyme. 
- le nombre de téléchargement : plus, il y a de téléchargement mieux c'est. 
- la version : mieux vaut prendre une box avec une version la plus récente 
- la disponibilité de téléchargement : vagrant cloud regarde périodiquement si les box hébergé en externe sont toujours disponible ou non. 

### Q2.3 - Créer un dossier ~/tp-r504/TP5/vag1. Dans ce dossier, lancer une VM Debian11 avec les deux commandes Vagrant (voir slides CM).Examiner la sortie console lors du lancement. Où est stocké l’image "libvirt" de l’OS 
le provider est virtualbox donc : 
ls -l ~/VirtualBox\ VMs/

### Q2.4 - Donner la taille occupée sur le disque par l’ensemble du dossier système "libvirt" correspondant (commande du) :
```
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5/vag1$ du -sh ~/VirtualBox\ VMs/vag1_default_1762261181944_24183/
3.4G	/home/fi25-laroc/VirtualBox VMs/vag1_default_1762261181944_24183/
```

### Q2.5 - Donner la taille occupée sur le disque par l’image "Vagrant" (voir slides de CM) :

du -h ~/.vagrant.d/boxes

donc : 1.3G

### Q2.6 - Se connecter à la VM en SSH. Quel est votre nom d’utilisateur ? Avec quel commande obtient-on cette information ?
```
vagrant@debian11:~$ whoami
vagrant
```

### Q2.7 - Quel est le dossier courant ? Avec quelle commande obtient-on cette information 
```
vagrant@debian11:~$ pwd
/home/vagrant
```

### Q2.8 - Toujours connecté, créer dans la VM dans le dossier ~/vagrant un ﬁchier toto. Quitter la VM, et vériﬁer que le ﬁchier est bien présent dans l’hôte.

```
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5/vag1$ vagrant ssh
vagrant@127.0.0.1's password: 
vagrant@127.0.0.1's password: 
Last login: Tue Nov  4 13:49:35 2025 from 10.0.2.2
vagrant@debian11:~$ mkdir vagrant
vagrant@debian11:~$ touch 
.bash_history  .vagrant/      vagrant/       Vagrantfile
vagrant@debian11:~$ touch vagrant/toto
vagrant@debian11:~$ exit
logout
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5/vag1$ ls
vagrant  Vagrantfile


```

### Q2.9 - Quelle est la commande qui afﬁche la liste des machines "Vagrant". Quel est le statut de celle que vous venez de quitter ?
```
vagrant global-status
id       name    provider   state   directory                           
------------------------------------------------------------------------
6c3e7ff  default virtualbox running /home/fi25-laroc/tp-r504/TP5/vag1   
```
donc le statut est running 

### Q2.10 - Vagrant a crée dans le dossier un dossier caché. Quel taille occupe-t-il sur le disque ?

```
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5/vag1$ du -sh .vagrant/
68K	.vagrant/

```

### Q2.11 - Détruisez la VM. La taille du dossier caché a-t-elle signiﬁcativement changé 

après un vagrant destroy

```
fi25-laroc@IUTR-25-69a2:~/tp-r504/TP5/vag1$ du -sh .vagrant/
28K	.vagrant/
```

## 3 Provisionnement d’application
### Q3.1 - Dans votre dossier TP5/vag1, créer un fichier index.html minimal (mais conforme).
### Q3.2 - Voir dans les slides de cours la partie "provisionnement".
### Q3.3 - Editer le "Vagrantfile" présent dans TP5/vag1 et ajoutez-y la copie de ce fichier index.html vers la VM (sans préciser de chemin dans celle ci). Puis lancer la VM et s’y connecter. Où le fichier a-t-il été placé ?
dans le /home/vagrant. 
```
  config.vm.provision "file", source:"../index.html", destination: "/home/vagrant/index.html"


```
### Q3.4 - Quitter la VM, l’arreter, puis ajouter dans le "Vagrantfile" l’installation du serveur web Nginx, via les paquets de la distribution (ne pas oublier de faire avant un "apt update").
### Q3.5 - Recharger la configuration (cf. slides de CM), puis redémarrer la machine, s’y connecter, et vérifier avec $ systemctl status nginx que le serveur est actif.
### Q3.6 - Dans la VM, utiliser la commande "find" pour localiser dans le dossier /etc l’emplacement du fichier de configuration de Nginx 2.
```
vagrant@debian11:~$ find /etc/nginx/
/etc/nginx/
/etc/nginx/mime.types
/etc/nginx/sites-enabled
/etc/nginx/sites-enabled/default
/etc/nginx/nginx.conf   <- notre fichier de configuration
/etc/nginx/fastcgi.conf
```



### Q3.7 - Préparer en local un fichier de configuration pour Nginx de telle sorte qu’il publie le fichier "index.html" en statique sur le port 80. Voir ici pour un exemple : https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/
### Q3.8 - Ajouter la translation du port dans le Vagrantfile (cf. slide CM), de façon à pouvoir visualiser la page dans un navigateur dans l’hote.

```
  config.vm.network "fowarded_port", guest: 80, host: 8080
```
### Q3.9 - Réinitialiser et vérifier le fonctionnement : vous devez acceder depuis la machine hote au serveur Web.
réussi 


## 4 Accès depuis une deuxième VM
### Q4.1 - Dans une dossier TP5/vag2, lancer une deuxième VM similaire avec Vagrant.
### Q4.2 - Configurer les deux machines pour que la machine N°2 puisse acceder au serveur Web de la première. (il faudra s’intéresser aux aspects réseaux, ports et adresses IP).

```
  config.vm.network "private_network", ip: "192.168.56.10" #vag1
  config.vm.network "private_network", ip: "192.168.56.11" #vag2

#depuis la vm2
vagrant@debian11:~$ curl http://192.168.56.10
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ma page Vagrant</title>
</head>
<body>
    <h1>Bonjour !</h1>
</body>
</html>

```
## 5 Accès graphique
### Il est (theoriquement...) possible d’accèder au bureau de la VM depuis la machine hote. Ceci implique d’activer le "forwarding" du serveur X de la VM de façon à y acceder depuis l’hote.
### Q5.1 - Dans la VM, editer le fichier /etc/ssh/sshd_config et ajouter la ligne ForwardX11 yes
### Q5.2 - Redémarrer la VM et s’y connecter avec $ vagrant -Y ssh

```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no

```

X11UseLocalhost était avant en "yes" est rien ne fonctionner. Cependant en métant en "no", cela fonctionne enfin. 
