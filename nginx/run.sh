#!/bin/bash

echo "$DB"
echo "$1"

if [ "$1" = 'dev' ]
then
echo Hello $1.
else
echo "No parameters found. "
fi

PS1='\[\e[0;92m\]\u\[\e[0;1;38;5;200m\]@\[\e[0;38;5;37m\]  $($(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"') | \H) \[\e[0m\]:\[\e[0m\] \[\e[0;38;5;202m\]\w\[\e[0m\] \[\e[0;1;38;5;75m\]$\[\e[0m\] \[\e[0m\]\h\[\e[0m\]_\[\e[0m\]\[\e[0m\]'
