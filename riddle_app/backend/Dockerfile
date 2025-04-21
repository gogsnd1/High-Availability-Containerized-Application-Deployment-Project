
# Use an official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy backend code
COPY . /app

# Install dependencies
RUN pip install flask psycopg2-binary

# Run the app
CMD ["python", "app.py"]
