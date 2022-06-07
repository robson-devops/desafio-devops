FROM python:slim-buster

WORKDIR /app

COPY app/api.py .
COPY app/requirements.txt .
COPY app/entrypoint.sh .

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["sh","entrypoint.sh"]