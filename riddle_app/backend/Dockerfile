# Use an official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy backend code
COPY . .

# Install dependencies
RUN pip install flask

# Run the app
CMD ["python", "app.py"]
