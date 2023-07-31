# pull official base image
FROM python:3.11-alpine

RUN apk update && apk add libffi-dev gcc musl-dev


# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/app

# install dependencies
# Install system dependencies


RUN pip install pip setuptools
RUN pip install --upgrade pip

EXPOSE 8000

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


