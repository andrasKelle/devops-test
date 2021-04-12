FROM python:3.9-slim-buster

## install dependencies
RUN apt-get update && \
    apt-get upgrade -y

## set working directory
WORKDIR /app

## add and install requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

## add app
COPY app.py .

## set app.py as entrypoint
ENTRYPOINT ["python", "app.py"]