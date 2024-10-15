# Usar a imagem base do Icecast
FROM moul/icecast:latest

# Criar o diretório se ele não existir
RUN mkdir -p /etc/icecast2

# Copiar o arquivo de configuração do Icecast
COPY ./etc/icecast2/icecast.xml /etc/icecast2/icecast.xml

# Defina as variáveis de ambiente
ENV ICECAST_SOURCE_PASSWORD=hackme \
    ICECAST_ADMIN_PASSWORD=hackme \
    ICECAST_PASSWORD=hackme \
    ICECAST_RELAY_PASSWORD=hackme

# Comando para iniciar o Icecast
CMD ["icecast", "-c", "/etc/icecast2/icecast.xml"]


