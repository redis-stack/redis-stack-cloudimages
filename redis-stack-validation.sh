#!/bin/sh

set -x

# Delete all SSH authorized keys for the current user
sudo rm -f ~/.ssh/authorized_keys

sudo apt install redis-tools -y
sleep 10
redis_modules=$(redis-cli module list | wc | awk '{print $1}')
if [ "$redis_modules" -gt 1 ]; then
    echo "Redis has more than one module installed."
else
    echo "Redis has no modules installed"
    exit 1
fi
# Flush all logs
sudo rm /var/log/syslog* /var/log/auth*