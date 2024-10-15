# Use uma imagem base do Debian
FROM debian:bullseye-slim

# Instale o Icecast e as dependências
RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 && \
    apt-get -y autoclean && \
    apt-get clean

# Crie o diretório para logs e arquivos de acesso
RUN mkdir -p /var/log/icecast2 && \
    touch /var/log/icecast2/access.log && \
    touch /var/log/icecast2/error.log

# Defina as permissões apropriadas
RUN chmod 777 /var/log/icecast2/access.log && \
    chmod 777 /var/log/icecast2/error.log

# Exponha a porta do Icecast
EXPOSE 8000

# Defina as variáveis de ambiente
ENV ICECAST_SOURCE_PASSWORD=changeme \
    ICECAST_ADMIN_PASSWORD=changeme \
    ICECAST_PASSWORD=changeme \
    ICECAST_RELAY_PASSWORD=changeme

# Comando para iniciar o Icecast
CMD ["icecast", "-c", "/etc/icecast2/icecast.xml"]

