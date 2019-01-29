FROM debian:9.6-slim

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /var/run/sshd

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

ENV LOCAL_HOST 0.0.0.0
ENV LOCAL_PORT 9000
ENV FORWARD_HOST localhost
ENV FORWARD_PORT 80
ENV DESTINATION_USERNAME root
ENV DESTINATION_PORT 22

CMD ["./start.sh"]
