# URL de base
url="http://localhost:83"

# Nombre d'appels
calls=6

# Initialiser une variable pour suivre le dernier serveur
last_server=""

# Boucle pour effectuer les appels
for ((i=1; i<=calls; i++)); do
    # Effectuer l'appel avec curl et récupérer la réponse
    response=$(curl -s $url)

    # Vérifier quelle réponse a été reçue
    if [[ "$response" == "<h1>Hello 1</h1>" ]]; then
        current_server="nginx1"
    elif [[ "$response" == "<h1>Hello 2</h1>" ]]; then
        current_server="nginx2"
    else
        echo "Appel $i : Réponse inattendue : $response"
        continue
    fi

    # Vérifier si la réponse alterne entre les serveurs
    if [[ "$current_server" == "$last_server" ]]; then
        echo "Appel $i : Erreur - réponse du même serveur $current_server"
    else
        echo "Appel $i : Réponse correcte - serveur $current_server"
    fi

    # Mettre à jour le dernier serveur
    last_server="$current_server"

    # Pause optionnelle pour éviter de surcharger les serveurs
    # sleep 0.1  # Décommenter pour mettre une petite pause si nécessaire
done

echo "Test terminé."