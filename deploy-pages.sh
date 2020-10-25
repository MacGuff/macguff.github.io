#!/bin/bash

set -e

abp && git checkout master
/bin/cp -rf dist/* .
git add .
git commit -m "site updated: $(date '+%F %T')"
git push origin master

[ $? -eq 0 ] && echo "部署至gh-pages成功！"
git checkout src
git push origin src