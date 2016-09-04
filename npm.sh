# get nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

nvm install 6.2.0
nvm use 6.2.0

# global npm packages
packages=(
  gulp
  stream-adventure
  webpack
)

npm i -g "${packages[@]}"

