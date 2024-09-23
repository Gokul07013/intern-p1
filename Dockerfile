# Use the official Python 3 image
FROM python:3.12

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y python3-setuptools python3-pip python3-dev

# Upgrade setuptools to ensure distutils compatibility
RUN pip install --upgrade setuptools

# Copy all project files to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run Django migrations
RUN python manage.py migrate

# Expose the Django default port
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
