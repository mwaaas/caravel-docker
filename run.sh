#!/usr/bin/env bash

# Create an admin user
fabmanager create-admin --app caravel --username admin --firstname admin --lastname admin --password admin --email admin@example.com

# Initialize the database
caravel db upgrade

# Create default roles and permissions
caravel init

# Load some data to play with
#caravel load_examples

# Start the web server on port 8088
caravel runserver -p 8088
