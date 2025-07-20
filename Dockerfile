FROM --platform=linux/amd64 7techlife/sevenhy2

RUN apk add --no-cache openssh-server

# Create SSH host keys and configure SSH
RUN ssh-keygen -A && \
    mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# Set up SSH directory
RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh

WORKDIR /app
COPY start-ssh-hy2.sh /app/
ENTRYPOINT ["/bin/bash", "/app/start-ssh-hy2.sh"]