#! /usr/bin/env bash

# get nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

nvm install 8.9.0
nvm use 8.9.0

# global npm packages
packages=(
    eslint,
    dat
)

npm i -g "${packages[@]}"

