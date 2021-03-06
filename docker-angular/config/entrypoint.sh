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
if [ -n "${NG_BUILD_COMMAND}" ]; then
    ${NG_BUILD_COMMAND}
else
    ng build 
fi

echo "/Entrypoint"

# exec next command
exec "$@"