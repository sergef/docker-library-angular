#!/bin/sh
set -e

apk add --update-cache \
  nodejs \
  nodejs-npm
npm config set registry $NPM_REPO
npm install -g @angular/cli
npm install
# npm run test
# # remove karma temp folder as is not being removed by karma itself
# echo "Removing temp karma and typescript folders..."
# rm -rf /build/karma-* /build/ts-node-*
npm run build
mv -v /application/dist/* /app
npm cache clean
apk del \
  nodejs \
  nodejs-npm
rm -rf \
  /application/dist \
  /usr/lib/node_modules \
  /tmp/* \
  /var/cache/apk/*
