#!/usr/bin/env bash

set -e

repos=(
  'junegunn/vader.vim'
  'jwalton512/vim-blade'
  'kana/vim-textobj-user'
)

cd "$(dirname "$0")/.."
mkdir -p pack/testing/start
cd pack/testing/start

# Add our plugin to the pack.
ln -s ../../.. vim-textobj-blade-directive

for repo in ${repos[@]}
do
  git clone https://github.com/$repo.git
done
