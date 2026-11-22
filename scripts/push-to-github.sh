#!/usr/bin/env bash
# 将本目录推到 github.com/jasonmin/dailytasks_page 并触发 Pages。
# 用法：在 dailytasks_page 目录执行 ./scripts/push-to-github.sh
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

REMOTE="${REMOTE:-git@github.com:Jasonmin/dailytasks_page.git}"
BRANCH="${BRANCH:-main}"

if [[ ! -d .git ]]; then
  git init -b "$BRANCH"
  git remote add origin "$REMOTE"
fi

git add -A
if git diff --staged --quiet 2>/dev/null; then
  echo "无变更"
else
  git commit -m "Update dailytasks legal pages"
fi

git push -u origin "$BRANCH"
echo "GitHub → Settings → Pages → Source: GitHub Actions（或 Deploy from branch $BRANCH / root）"
echo "公网：https://jasonmin.github.io/dailytasks_page/"