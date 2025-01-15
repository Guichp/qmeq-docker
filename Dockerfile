# Use an image based on Python 3
FROM python:3.8-slim

# Establish the working directory
WORKDIR /app

# Install needed system dependencies for Cython and compiling
RUN apt-get update && apt-get install -y \
    gcc \
    git \
    g++ \
    make \
    --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install needed Python dependencies for QmeQ
RUN pip install --no-cache-dir \
    cython \
    numpy \
    scipy \
    matplotlib \
    jupyter

# Install QmeQ from pip
RUN pip install --no-cache-dir qmeq

# Copy repo and get into its directory
COPY qmeq /app/
WORKDIR /app/qmeq

# Option to add tests (optional)
# RUN pip install --no-cache-dir pytest
# COPY . /app
# RUN pytest tests

# Deafult command to initiate the container 
CMD ["python"]
