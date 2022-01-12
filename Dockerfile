FROM python:3.9-alpine

RUN mkdir /app

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt


CMD ["python", "main.py"]