# Usa a imagem oficial do Node.js
FROM node:14

# Define o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copia os arquivos do projeto para o diretório de trabalho
COPY app.js /usr/src/app

# Inicializa um projeto Node.js e instala o Express
# Express é um framework web para Node.js
RUN npm init -y && npm install express

# Define o comando para executar a aplicação
# Inicia o servidor Express na porta 3000
CMD ["node", "app.js"]
