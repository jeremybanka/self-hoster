FROM ubuntu:latest

# Install necessary packages for the client
RUN apt-get update && apt-get install -y \
    ssh \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add test script
COPY tests/client-test.sh /client-test.sh
RUN chmod +x /client-test.sh

CMD ["tail", "-f", "/dev/null"]
