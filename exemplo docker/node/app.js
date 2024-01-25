
const express = require('express');
const os = require('os');

const app = express();
const hostname = os.hostname();

const getServerIP = () => {
    const networkInterfaces = os.networkInterfaces();
    for (let interface in networkInterfaces) {
        for (let address of networkInterfaces[interface]) {
            if (address.family === 'IPv4' && !address.internal) {
                return address.address;
            }
        }
    }
    return '127.0.0.1';
};

const serverIP = getServerIP();

app.get('/', (req, res) => {
    let current_time = new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '');

    let style = "<style>* { background-color: black; color: #33ff33; font-family: 'Courier New', monospace; }</style>";

    res.send(`${style}
              SERVIDOR NODE: ${hostname}<br>
              Endereço IP: ${serverIP}<br>
              Hora Atual: ${current_time}<br>
              Sistema Operacional: ${os.type()}<br>
              Versão do SO: ${os.release()}
              <br><br>
              Servidor PHP <a href="http://127.0.0.1:8000">http://127.0.0.1:8000</a><br>
              Servidor PYTHON <a href="http://127.0.0.1:5000">http://127.0.0.1:5000</a><br>
              Servidor NODE <a href="http://127.0.0.1:3000">http://127.0.0.1:3000</a><br>`);
});

app.listen(3000, () => {
    console.log('Node Server running on http://127.0.0.1:3000');
});
