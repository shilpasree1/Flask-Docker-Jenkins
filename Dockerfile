FROM ubuntu:20.04

FROM python:3.6.5

RUN /bin/sh -c apt update && \
    apt-get install -y --fix-missing python-pip python-dev


WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD python /app/model.py && python /app/server.py
