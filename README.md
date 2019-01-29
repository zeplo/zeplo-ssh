# Zeplo SSH

This repo contains two Docker images that work together to create an SSH tunnel from a Zeplo service to an external service.

 * ssh-sidecar - should be run inside of Zeplo (as a sidecar) to forward traffic to an external service

 * ssh-remote - should be run on an external host to allow a tunnel to be created within a Docker/Kubernetes environment


 Full instructions on how to use these images can be found at [Zeplo Docs - Connecting to External Services](https://zeplo.io/docs/external-services).


### ssh-sidecar

Accepts the following environment vars:

| Name  | Default | Desc |
|:---- |:-------- |:-------------------------- |
| PRIVATE_SSH_KEY | - | **Required** Private SSH key that will be used for authentication |
| LOCAL_PORT | 9000 | Container port to expose the forwarded service |
| FORWARD_HOST | localhost | Host to forward (from the perspective of the destination remote server)
| FORWARD_PORT | 80 | Port to forward to your Zeplo service
| DESTINATION_USERNAME | root | Username for SSH login
| DESTINATION_HOST | - | **Required** Destination IP or domain name
| DESTINATION_PORT | 22 | Port for SSH connection


### ssh-remote

Accepts the following environment vars:

| Name  | Default | Desc |
|:---- |:-------- |:-------------------------- |
| PUBLIC_SSH_KEY | - | **Required** Public SSH key that matches the `ssh-sidecar` public key |