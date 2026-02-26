FROM python:3.9-slim

WORKDIR /app

# Install system dependencies for sqlite3
RUN apt-get update && apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*

# Install python dependencies
RUN pip install --no-cache-dir requests nltk
RUN python -m nltk.downloader punkt punkt_tab

# Final script runs from spiderEval directory but needs access to parent data
CMD ["python3", "-u", "benchmark_tensor.py"]
