#!/bin/bash
set -x

cd /var/www/html

# Install npm packages
if [ -f package.json ]; then
    yarn install
else
    echo "You haven't any Angular project in this directory. Please create a volume to plug a project."
    exit
fi

# Build
if [ -n "${ENVIRONMENT}" ]; then
    ng build --service-worker --environment=${ENVIRONMENT}
else
    ng build --service-worker 
fi

echo "/Entrypoint"

# exec next command
exec "$@"