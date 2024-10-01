docker run -d \
    --name tp4-app-D2 \
    --network net-tp4 \
    -p 5000:5000 \
    -v "/home/larocleo/tp-r504/TP4/srv:/srv" \
    im-tp4d2