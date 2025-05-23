#!/bin/bash
set -e

# Проверяем переменные среды
if [ -z "$PROXY_IP" ] || [ -z "$PROXY_PORT" ]; then
  echo "ERROR: PROXY_IP and PROXY_PORT must be set"
  exit 1
fi

# Генерируем конфиг proxychains4
cat > /etc/proxychains4.conf <<EOF
strict_chain
proxy_dns
[ProxyList]
socks5 $PROXY_IP $PROXY_PORT $PROXY_USER $PROXY_PASS
EOF

echo "👉 Запускаем Open WebUI через SOCKS5 proxychains4..."

# Проксируем оригинальный стартовый скрипт
exec proxychains4 bash start.sh
