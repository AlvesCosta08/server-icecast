FROM moul/icecast
ADD ./icecast.xml /etc/icecast2

# Defina as variáveis de ambiente
ENV ICECAST_SOURCE_PASSWORD=hackme \
    ICECAST_ADMIN_PASSWORD=hackme \
    ICECAST_PASSWORD=hackme \
    ICECAST_RELAY_PASSWORD=hackme

# Comando para iniciar o Icecast
CMD ["icecast", "-c", "/etc/icecast2/icecast.xml"]

