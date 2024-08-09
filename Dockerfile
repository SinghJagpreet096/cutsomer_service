FROM python:3.10.12

WORKDIR /app  

COPY . .

# RUN brew install pygobject3

RUN pip install -r requirements.txt

CMD ["streamlit", "run", "app.py"] 

FROM python:3.12-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-setuptools \
    && apt-get clean

# Install dependencies
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app

CMD ["streamlit", "run", "app.py"]
