FROM python:3.10-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Use environment variable PORT (set by Cloud Run)
EXPOSE 8080

# Tell Streamlit to use that port
CMD ["streamlit", "run", "app.py", "--server.port=${PORT}", "--server.enableCORS=false"]
