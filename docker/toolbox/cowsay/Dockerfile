FROM debian
RUN apt-get update -y\
    && apt-get install -y \
    cowsay \
    fortune
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


