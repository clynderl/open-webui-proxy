#!/bin/bash
set -e

if [ -z "$PROXY_IP" ] || [ -z "$PROXY_PORT" ]; then
  echo "ERROR: PROXY_IP and PROXY_PORT must be set"
  exit 1
fi

cat > /etc/proxychains4.conf <<EOF
strict_chain
proxy_dns
[ProxyList]
socks5 $PROXY_IP $PROXY_PORT $PROXY_USER $PROXY_PASS
EOF

echo "Starting command through proxychains4..."
exec proxychains4 "$@"
