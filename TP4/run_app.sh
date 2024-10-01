docker run -d \
    --name tp4-app-D2 \
    --network net-tp4 \
    -p 5000:5000 \
    -v "$(pwd)/TP4/srv:/srv" \ 
    im-tp4-v2