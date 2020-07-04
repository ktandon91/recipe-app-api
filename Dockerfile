#image file
FROM python:3.7-alpine
MAINTAINER Karan Tandon

#Setting env variables in docker
ENV PYTHONUNBUFFERED 1
#copy requirements from local to docker image
COPY ./requirements.txt /requirements.txt

#update resistry but don't store it
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .temp-build-deps\
        gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt

RUN apk del .temp-build-deps

RUN mkdir /app
COPY ./app /app
WORKDIR /app


#-D only allow user to run application
RUN adduser -D user
USER root


