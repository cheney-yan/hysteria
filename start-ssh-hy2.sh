#!/bin/sh

# Set up SSH public key if provided
if [ -n "$SSH_PUBLIC_KEY" ]; then
  echo "$SSH_PUBLIC_KEY" > /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys
fi

# Start SSH daemon in background
/usr/sbin/sshd -D &

# Execute the main command (hysteria)
/bin/bash /app/start-hy2.sh "$@"