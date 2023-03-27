#!/bin/sh

set -x
sudo apt-get update
# Check architecture
architecture=$(uname -m)

if [ "$architecture" = "x86_64" ]; then
    curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
    sudo apt-get update
    sudo apt-get install -y redis-stack-server
    sudo redis-stack-server --daemonize yes

elif [ "$architecture" = "aarch64" ]; then
    sudo apt-get update
    sudo apt-get install -yq python3 python3-pip python3-venv git gdebi-core libffi-dev libssl-dev
    sudo apt-get update
    sudo apt-get install ruby-dev -yq
    sudo gem install fpm
    export PATH=$PATH:/home/ubuntu/.local/bin
    # Install venv tools
    python3 -m venv venv
    . venv/bin/activate
    pip3 install --upgrade pip
    pip3 install poetry
    # Clone redis-stack/redis-stack repo
    cd venv
    git clone https://github.com/redis-stack/redis-stack.git
    # Change directory
    cd redis-stack
    # Install the dependencies
    poetry install
    invoke package -e "master" -o Linux -s ubuntu20.04 -d focal -a arm64 -t deb -p redis-stack-server
    mkdir $HOME/redis-stack-deb 
    cp *redis-stack-server*.deb $HOME/redis-stack-deb && cd $HOME/redis-stack-deb
    sudo gdebi -n *redis-stack-server*.deb
    sudo redis-stack-server --daemonize yes
else
    echo "Unsupported architecture: $architecture"
    exit 1
fi

# Delete all SSH authorized keys for the current user
sudo rm -f ~/.ssh/authorized_keys
