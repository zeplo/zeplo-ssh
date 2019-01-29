#! /bin/sh

# Check we have required env vars (for better error messages)
if [ -z "$PRIVATE_SSH_KEY" ]; then
  echo '$PRIVATE_SSH_KEY is required but not set' >&2
  exit 1
fi

if [ -z "$DESTINATION_HOST" ]; then
  echo '$DESTINATION_HOST is required but not set' >&2
  exit 1
fi

# Create SSH user dir
mkdir -p ~/.ssh

# Copy public key and set required permissions
echo "$PRIVATE_SSH_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chmod 700 /root/.ssh

# Create the tunnel
ssh -N -4 -L $LOCAL_HOST:$LOCAL_PORT:$FORWARD_HOST:$FORWARD_PORT $DESTINATION_USERNAME@$DESTINATION_HOST -p $DESTINATION_PORT -o StrictHostKeyChecking=no
