#!/bin/bash

SERVER_IP=server  # Docker Compose sets this in the network

# Positive Tests
echo "Testing allowed connections..."

# SSH on port 22
if ssh -o ConnectTimeout=5 -p 22 user@$SERVER_IP exit; then
  echo "SSH on port 22: SUCCESS"
else
  echo "SSH on port 22: FAILURE"
fi

# SSH on port 2222
if ssh -o ConnectTimeout=5 -p 2222 user@$SERVER_IP exit; then
  echo "SSH on port 2222: SUCCESS"
else
  echo "SSH on port 2222: FAILURE"
fi

# HTTP on port 80
if curl -s --connect-timeout 5 http://$SERVER_IP:80 >/dev/null; then
  echo "HTTP on port 80: SUCCESS"
else
  echo "HTTP on port 80: FAILURE"
fi

# HTTPS on port 443
if curl -s --connect-timeout 5 https://$SERVER_IP:443 >/dev/null; then
  echo "HTTPS on port 443: SUCCESS"
else
  echo "HTTPS on port 443: FAILURE"
fi

# Negative Tests
echo "Testing disallowed connections..."

# SSH on port 23 (should fail)
if ssh -o ConnectTimeout=5 -p 23 user@$SERVER_IP exit; then
  echo "SSH on port 23: FAILURE (should be blocked)"
else
  echo "SSH on port 23: SUCCESS (blocked as expected)"
fi

# HTTP on port 8080 (should fail)
if curl -s --connect-timeout 5 http://$SERVER_IP:8080 >/dev/null; then
  echo "HTTP on port 8080: FAILURE (should be blocked)"
else
  echo "HTTP on port 8080: SUCCESS (blocked as expected)"
fi
