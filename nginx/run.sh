#!/bin/bash

echo "$DB"
echo "$1"

if [ "$1" = 'dev' ]
then
echo Hello $1.
else
echo "No parameters found. "
fi
