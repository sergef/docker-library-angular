#!/bin/sh
set -e

apk add --no-cache \
  nodejs \
  nodejs-npm
npm config set registry $NPM_REPO
npm install -g @angular/cli
