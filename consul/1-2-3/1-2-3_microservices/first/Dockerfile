FROM python:3.4

RUN pip install Flask requests
COPY cmd.sh /

EXPOSE 5000
CMD ["/cmd.sh"]