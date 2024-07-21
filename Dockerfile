FROM python:3.9-alpine
LABEL Author="joozero@amazon.com"
LABEL com.datadoghq.ad.logs='[{"source": "flask", "service": "flask", "log_processing_rules": [{"type": "multi_line", "name": "log_start_with_date", "pattern" : "\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}\\.\\d{3}"}]}]'
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
CMD ["python3", "app.py"]