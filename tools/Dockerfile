# Use an official Python runtime as a base image
FROM python:3.12-slim
RUN apt-get update
RUN apt-get install -y git
# Set the working directory in the container
WORKDIR /app
COPY ./run.sh .
RUN git clone https://github.com/open-webui/openapi-servers.git ; \
cd openapi-servers/servers/time ; \
pip install -r requirements.txt
RUN cd openapi-servers/servers/weather ; \
pip install -r requirements.txt

# Install any needed packages specified in requirements.txt (or just mcpo)
RUN pip install --no-cache-dir mcpo
