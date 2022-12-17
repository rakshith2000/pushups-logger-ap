FROM python:3
ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
RUN pip install gunicorn
COPY . /code/
ENV NEW_RELIC_APP_NAME="docker-pushups-logger-app"
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LICENSE_KEY=55ae59a47b400ccb305fcd21d86d4d06529fNRAL
ENTRYPOINT [ "newrelic-admin", "run-program", "/usr/local/bin/gunicorn", "-b :5000", "app:app"]
