#!/bin/bash

echo "Enter your hamachi email address"

read hamachi_email

sudo cp ../files/hamachi/h2-engine-override.cfg /var/lib/logmein-hamachi/h2-engine-override.cfg;

sudo /etc/init.d/logmein-hamachi start;

sleep 3;

hamachi login;

hamachi set-nick vault;

hamachi attach $hamachi_email;

hamachi;
