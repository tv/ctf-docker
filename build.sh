#!/bin/bash
docker buildx build -t ctf .
docker buildx build --platform linux/arm64 -t ctf:arm64 -f Dockerfile.arm64 .
