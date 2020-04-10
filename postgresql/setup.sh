#!/bin/sh
if ! [ -x "$(command -v psql)" ]; then
echo "Installing postgresql"
  sudo apt install -y postgresql postgresql-contrib libpq-dev
  sudo -u postgres createuser -d -s -w $(whoami)
  sudo -u postgres createdb $(whoami)
fi
