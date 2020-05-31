#!/bin/bash

if [ -e build.sh ]
then
    . build.sh
else
    hexo clean; hexo d -g
fi

echo
echo "deploy to git successed!"