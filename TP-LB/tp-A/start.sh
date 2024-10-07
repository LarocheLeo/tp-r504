# Étape (a):

docker build -t im-nginx-lb -f Dockerfile .

# Étape (b):

mkdir -p shared1 
mkdir -p shared2

# Étape (c):

echo "<h1>Hello 1</h1>" > $(pwd)/shared1/index.html
echo "<h1>Hello 2</h1>" > $(pwd)/shared2/index.html


# Étape (d):

docker run --network tp8 -d --name nginx1 -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx:latest
docker run --network tp8 -d --name nginx2 -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx:latest

# Étape (e):

docker run --network tp8 -d --name nginx-lb -p 83:80 im-nginx-lb