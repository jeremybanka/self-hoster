FROM ubuntu:latest

# Install necessary packages for the server
RUN apt-get update && apt-get install -y \
    git \
    ping \
    curl \
    iptables \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Add script to container
COPY iptables-rules.sh /iptables-rules.sh
RUN chmod +x /iptables-rules.sh

# Add test script
COPY server-test.sh /server-test.sh
RUN chmod +x /server-test.sh

# Set default command to run the firewall script and keep the container running
CMD ["/bin/bash", "-c", "/iptables-rules.sh && tail -f /dev/null"]
