FROM python:3.9-alpine

RUN mkdir /app
RUN mkdir /app/logs
RUN touch /app/logs/log.txt

WORKDIR /app

COPY requirements.txt .
COPY main.py .
RUN pip install -r requirements.txt

COPY ./cron/log-rotate /etc/cron.d/log-rotate
RUN chmod 0644 /etc/cron.d/log-rotate
RUN crontab /etc/cron.d/log-rotate

RUN touch /var/log/cron.log

CMD ["sh","-c", "crond && python main.py"]