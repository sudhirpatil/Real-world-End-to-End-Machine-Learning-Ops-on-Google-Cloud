FROM python:3.10-slim

ENV APP_HOME /app
WORKDIR $APP_HOME

# 1. Copy only requirements first to leverage Docker cache
COPY requirements.txt ./

# 2. Install dependencies (Cached unless requirements.txt changes)
RUN pip install --no-cache-dir -r requirements.txt && pip check

# 3. Copy the rest of the application files
COPY . ./

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
