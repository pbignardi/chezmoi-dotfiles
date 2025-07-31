#!/usr/bin/env bash

if type bw > /dev/null 2>&1; then
    bw login --check > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        bw login
    fi
    export BW_SESSION=$(bw unlock --raw)
else
    cd /tmp
    if ! [[ -d ~/bin ]]; then
        mkdir ~/bin
    fi

    if [[ $(uname -s) == "Linux" ]]; then
        wget https://github.com/bitwarden/clients/releases/download/cli-v2025.7.0/bw-linux-2025.7.0.zip
        unzip bw-linux-2025.7.0.zip -d .
    elif [[ $(uname -s) == "Darwin" ]]; then
        wget https://github.com/bitwarden/clients/releases/download/cli-v2025.7.0/bw-macos-2025.7.0.zip
        unzip bw-macos-2025.7.0.zip -d .
    fi

    chmod +x bw
    mv bw ~/bin/bw
    export PATH=~/bin:$PATH
    cd -
fi
