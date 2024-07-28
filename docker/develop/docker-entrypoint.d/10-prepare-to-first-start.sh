#!/bin/sh

set -eo

if [ ! -d "node_modules" ]; then
  npm install
fi

if [ ! -d "build" ]; then
  npm run build
fi
