# pull official base image
FROM python:3.11-alpine

# Install build tools and development libraries for Python and CFFI
RUN apk update && apk add libffi-dev gcc musl-dev

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install setuptools

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/app


EXPOSE 8000

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


