#!/bin/bash

CRT_PATH="./ssl/cert.crt"
KEY_PATH="./ssl/cert.key"

if [ ! -f "$CRT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
    echo "Creating self-signed SSL certificates..."
    mkdir -p ssl
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$KEY_PATH" -out "$CRT_PATH" -subj "//CN=localhost"
else
    echo "SSL certificates already exist."
fi