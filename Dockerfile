FROM python:3.14-slim

# Create non-root user with fixed UID/GID
RUN groupadd -g 1001 microservices-user \
    && useradd -u 1001 -g 1001 -m microservices-user

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy application files with correct ownership
COPY --chown=1001:1001 . .

# Switch to non-root user
USER microservices-user

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "-u", "run.py"]
