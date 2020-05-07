FROM debian
RUN apt-get update -y\
    && apt-get install -y \
    cowsay \
    fortune \
    wget
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


