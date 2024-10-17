# Use a imagem base do Icecast
FROM ubuntu:latest

# Atualiza o sistema e instala o Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean

# Expõe a porta padrão do Icecast
EXPOSE 8000

# Comando para iniciar o Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]






