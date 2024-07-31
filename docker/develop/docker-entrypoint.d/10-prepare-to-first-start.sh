#!/bin/sh

set -eo

if [ ! -d "node_modules" ]; then
  npm install
fi

if [ ! -d ".nuxt" ]; then
  npm run build
fi
