#!/bin/sh
if ! [ -x "$(command -v psql)" ]; then
  echo "Installing postgresql"
  sudo apt install postgresql postgresql-contrib libpq-dev
  sudo -u postgres createuser $(whoami)
  sudo -u postgres createdb $(whoami)
fi
