from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_word():
    # Affiche le nom du conteneur pour identifier le serveur
    return f"Hello from container {os.environ.get('HOSTNAME')}!"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

