FROM python:3.8.9-alpine3.13

RUN mkdir -p /home/app

RUN groupadd -r app && useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

ENV DJANGO_HOME=/home/app

RUN mkdir -p $DJANGO_HOME

WORKDIR $DJANGO_HOME

COPY --chown=app:app . $DJANGO_HOME

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

RUN pip install -r requirements.txt

USER app

EXPOSE 8000

ENTRYPOINT ["./docker-entrypoint.sh"]