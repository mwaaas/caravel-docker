#!/usr/bin/env bash

# Create an admin user
fabmanager create-admin --app caravel --username ${username:=admin} --firstname ${firstname:=admin} --lastname ${lastname:=admin} --password ${password:=admin} --email ${email:=admin@example.com}

# Initialize the database
caravel db upgrade

# Create default roles and permissions
caravel init

# Load some data to play with
#caravel load_examples

# Start the web server on port 8088
caravel runserver -p 80 -d


