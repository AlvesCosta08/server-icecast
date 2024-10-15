# Use uma imagem base Icecast confiável
FROM moul/icecast:latest

# Adicione o arquivo de configuração do Icecast ao diretório correto
COPY ./icecast2/icecast.xml /etc/icecast2/icecast.xml

# Defina as variáveis de ambiente necessárias para o Icecast
ENV ICECAST_SOURCE_PASSWORD=hackme \
    ICECAST_ADMIN_PASSWORD=hackme \
    ICECAST_PASSWORD=hackme \
    ICECAST_RELAY_PASSWORD=hackme

# Defina o comando para iniciar o Icecast usando o arquivo de configuração
CMD ["icecast", "-c", "/etc/icecast2/icecast.xml"]
