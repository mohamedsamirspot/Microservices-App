FROM python:3.14-slim

# Set work directory
WORKDIR /app

# Create non-root user
RUN useradd -m appuser

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Switch to non-root user
USER appuser

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "run.py"]
