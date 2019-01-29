#! /bin/sh

# Create SSH user dir
mkdir -p /root/.ssh/

# Copy public key
echo $PUBLIC_SSH_KEY >> /root/.ssh/authorized_keys

# Start SSHD
/usr/sbin/sshd -D -p $SSH_PORT

# Prevent exit
tail -f /dev/null