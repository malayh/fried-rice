#!/bin/bash

configure_ddcutil() {
    sudo modprobe i2c-dev || true

    if [ ! -f /etc/modules-load.d/i2c-dev.conf ]; then
        echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c-dev.conf > /dev/null
        echo "Created /etc/modules-load.d/i2c-dev.conf"
    else
        echo "/etc/modules-load.d/i2c-dev.conf already exists"
    fi

    if ! groups "$USER" | grep -q '\bi2c\b'; then
    sudo usermod -aG i2c "$USER"
        echo "Added $USER to i2c group"
    else
        echo "$USER is already in i2c group"
    fi
}

