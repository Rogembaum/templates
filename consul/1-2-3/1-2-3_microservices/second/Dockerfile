FROM python:3.4

RUN pip install Flask requests
COPY cmd.sh /

EXPOSE 5001
CMD ["/cmd.sh"]