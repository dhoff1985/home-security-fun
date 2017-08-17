from python:2.7.13-stretch
ADD scripts/* /scripts/
ADD templates /templates
RUN chmod +x /scripts/*
ENTRYPOINT bash
#ENTRYPOINT /scripts/mount-and-update.py