#!/usr/bin/env bash
# Usage: ./deploy.sh <github-username> [repo-name]
# Ex:    ./deploy.sh quentinpoyotte mmf-tracker
set -e

USER="${1:-}"
REPO="${2:-mmf-tracker}"

if [ -z "$USER" ]; then
  echo "Usage: ./deploy.sh <github-username> [repo-name]"
  exit 1
fi

cd "$(dirname "$0")"

git init -b main
git add .
git commit -m "Initial commit: MMF tracker"
git remote add origin "https://github.com/$USER/$REPO.git"
git push -u origin main

echo ""
echo "OK. Repo poussé sur https://github.com/$USER/$REPO"
echo "Active Pages : https://github.com/$USER/$REPO/settings/pages"
echo "URL finale  : https://$USER.github.io/$REPO/"
