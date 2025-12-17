FROM python:3.12-slim

# Dossier de travail dans le conteneur
WORKDIR /app

# Copier les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code
COPY . .

# Port utilisé par Flask
EXPOSE 5000

# Lancer Flask
CMD ["python", "app_1(1).py"]

