# Use a imagem base do Ubuntu
FROM ubuntu:latest

# Defina variáveis de ambiente para evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza o sistema e instala o Icecast sem configurar serviços
RUN apt-get update && \
    apt-get install -y --no-install-recommends icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cria um usuário e grupo não root para executar o Icecast
RUN useradd -m icecast && mkdir -p /var/log/icecast2 && chown -R icecast:icecast /var/log/icecast2 /etc/icecast2

# Expõe a porta padrão do Icecast
EXPOSE 8000

# Troca para o novo usuário
USER icecast

# Comando para iniciar o Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]







