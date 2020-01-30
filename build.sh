#!/bin/bash

npm install --global yarn
npm install --global electron-builder

yarn --cache-folder ./ycache
rm -rf ./ycache
yarn --pure-lockfile

yarn theia build

yarn --production
yarn autoclean --init
echo *.ts >> .yarnclean
echo *.ts.map >> .yarnclean
echo *.spec.* >> .yarnclean
yarn autoclean --force
yarn cache clean

yarn package