#image file
FROM python:3.7-alpine
MAINTAINER Karan Tandon

#Setting env variables in docker
ENV PYTHONUNBUFFERED 1

#copy requirements from local to docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#-D only allow user to run application
RUN adduser -D user
USER user

