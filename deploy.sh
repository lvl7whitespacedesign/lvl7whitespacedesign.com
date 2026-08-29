#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./deploy.sh \"commit message here\""
  exit 1
fi

git add -A
git commit -m "$1" || echo "Nothing new to commit, continuing with build..."
hugo --minify
sudo rsync -av --delete public/ /var/www/lvl7whitespacedesign.com/public/
echo "Deployed: $1"
