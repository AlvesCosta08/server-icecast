# Usar a imagem base do Debian
FROM debian:stable-slim

# Instalar dependências e Icecast
RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 && \
    apt-get -y autoclean && \
    apt-get clean

# Criar o diretório e arquivo de configuração
RUN mkdir -p /etc/icecast2 && \
    touch /var/log/icecast2/access.log && \
    touch /var/log/icecast2/error.log

# Defina as permissões adequadas para os arquivos de log
RUN chmod 666 /var/log/icecast2/access.log && \
    chmod 666 /var/log/icecast2/error.log

# Defina as variáveis de ambiente
ENV ICECAST_SOURCE_PASSWORD=hackme \
    ICECAST_ADMIN_PASSWORD=hackme \
    ICECAST_PASSWORD=hackme \
    ICECAST_RELAY_PASSWORD=hackme

# Copiar o arquivo de configuração do Icecast
COPY ./etc/icecast2/icecast.xml /etc/icecast2/icecast.xml

# Comando para iniciar o Icecast
CMD ["icecast", "-c", "/etc/icecast2/icecast.xml"]



