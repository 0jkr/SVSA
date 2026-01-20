FROM python:3.11-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /app/requirements.txt
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nmap \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY ./src /app/src
WORKDIR /app/src
ENV PYTHONPATH=/app/src

CMD ["uvicorn", "svsa_monolith:create_api_app && uvicorn", "--host", "0.0.0.0", "--port", "8000"]
