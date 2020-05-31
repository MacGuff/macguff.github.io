#!/bin/bash

if [ -e build.sh ]
then
    . build.sh
    hexo d
else
    hexo clean; hexo d -g
fi

echo
echo "deploy to git successed!"