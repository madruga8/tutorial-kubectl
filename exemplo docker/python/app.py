from flask import Flask
import socket
import platform
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def show_hostname():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    style = "<style>* { background-color: black; color: #33ff33; font-family: 'Courier New', monospace; }</style>"

    return f"""
    {style}
    SERVIDOR PYTHON: {hostname}<br>
    Endereço IP: {ip_address}<br>
    Hora Atual: {current_time}<br>
    Sistema Operacional: {platform.system()}<br>
    Versão do SO: {platform.release()}
    <br><br>
    Servidor PHP <a href="http://127.0.0.1:8000">http://127.0.0.1:8000</a><br>
    Servidor PYTHON <a href="http://127.0.0.1:5000">http://127.0.0.1:5000</a><br>
    Servidor NODE <a href="http://127.0.0.1:3000">http://127.0.0.1:3000</a><br>
    """


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
