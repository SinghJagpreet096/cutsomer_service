FROM python:3.12-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
            libportaudio2 libportaudiocpp0 portaudio19-dev ffmpeg \
            python3-dev \
            build-essential \
            && rm -rf /var/lib/apt/lists/*

# Install dependencies
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app

CMD ["streamlit", "run", "app.py", "--server.port", "7860"]
