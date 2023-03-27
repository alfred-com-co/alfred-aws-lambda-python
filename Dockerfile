# Define function directory
ARG FUNCTION_DIR="/src"

FROM python:3.10.10-slim-bullseye AS builder

# Install aws-lambda-cpp build dependencies
RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
  g++ \
  make \
  cmake \
  unzip \
  libcurl4-openssl-dev \
  && rm -rf /var/lib/apt/lists/*

# Include global arg in this stage of the build
ARG FUNCTION_DIR

# Create function directory
RUN mkdir -p ${FUNCTION_DIR}

# Copy function code
COPY src/lambda_function.py ${FUNCTION_DIR}/lambda_function.py

# Install the runtime interface client
COPY requirements.txt .
RUN pip install \
        --target ${FUNCTION_DIR} \
        -r requirements.txt

# Multi-stage build: grab a fresh copy of the base image
FROM python:3.10.10-slim-bullseye AS runner

# Include global arg in this stage of the build
ARG FUNCTION_DIR

# Set working directory to function root directory
WORKDIR ${FUNCTION_DIR}

# Copy in the build image dependencies
COPY --from=builder ${FUNCTION_DIR} ${FUNCTION_DIR}

ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]
CMD [ "lambda_function.lambda_handler" ]
