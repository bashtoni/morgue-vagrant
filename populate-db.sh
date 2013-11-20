#!/bin/sh

for file in postmortems images links; do
  sed -e 's/utf8mb4/utf8/g' /vagrant/morgue/schemas/${file}.sql |
    mysql -u root -prootpw morgue
done
