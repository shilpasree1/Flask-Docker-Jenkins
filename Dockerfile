FROM ubuntu:20.04

FROM python:3.8

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev


WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD python /app/model.py && python /app/server.py
