FROM ubuntu:16.04

FROM python:3.6.5

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD python /app/model.py && python /app/server.py
