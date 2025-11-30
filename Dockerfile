FROM python:3.14-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "run.py"]
