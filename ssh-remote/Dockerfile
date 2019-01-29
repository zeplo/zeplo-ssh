FROM debian:9.6-slim

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /var/run/sshd

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

ENV SSH_SERVER_PORT 22

CMD ["/start.sh"]
