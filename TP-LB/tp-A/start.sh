# Étape (a):

ddocker network create --internal tplb

# Étape (b):

docker build -t im-nginx-lb -f Dockerfile .

# Étape (c):

mkdir -p shared1 
mkdir -p shared2

# Étape (d):

echo "<h1>Hello 1</h1>" > $(pwd)/shared1/index.html
echo "<h1>Hello 2</h1>" > $(pwd)/shared2/index.html


# Étape (e):

docker run --network tplb -d --name nginx1 -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx:latest
docker run --network tplb -d --name nginx2 -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx:latest

# Étape (f):

docker run --network tplb -d --name nginx-lb -p 83:80 im-nginx-lb