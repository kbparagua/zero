#!/bin/sh

sudo apt --purge remove postgresql
sudo apt --purge remove postgresql-10
sudo apt --purge remove postgresql-client-10
sudo apt --purge remove postgresql-client-common
sudo apt --purge remove postgresql-common
sudo apt --purge remove postgresql-contrib
sudo apt --purge remove pgdg-keyring postgresql*
sudo rm -rf /var/lib/postgresql
sudo rm -rf /var/log/postgresql
sudo rm -rf /etc/postgresql

sudo deluser postgres
sudo delgroup postgres
