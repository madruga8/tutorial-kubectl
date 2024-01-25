# Usa a imagem oficial do Python
FROM python:3.8-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o script Python para o contêiner
COPY app.py /app

# Instala o Flask, um microframework web para Python
RUN pip install flask

# Define o comando para executar a aplicação
# Roda o servidor Flask na porta 5000
CMD ["python", "./app.py"]
