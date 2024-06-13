# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run the command to install any necessary dependencies
RUN python3 -m pip install --upgrade pip \
  && python3 -m pip install --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
  && pipx install pre-commit ruff \
  && pre-commit install

# Run hello.py when the container launches
CMD ["python", "hello.py"]
