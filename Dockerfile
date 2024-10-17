# Use a imagem base do Icecast
FROM ubuntu:latest

# Atualiza o sistema e instala o Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean

# Copia o arquivo de configuração personalizado (se houver) para o contêiner
COPY icecast.xml /etc/icecast2/icecast.xml

# Define variáveis de ambiente para senhas do Icecast
ENV ICECAST_SOURCE_PASSWORD hackme
ENV ICECAST_ADMIN_PASSWORD hackme
ENV ICECAST_PASSWORD hackme
ENV ICECAST_RELAY_PASSWORD hackme

# Expõe a porta padrão do Icecast
EXPOSE 8000

# Comando para iniciar o Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]





