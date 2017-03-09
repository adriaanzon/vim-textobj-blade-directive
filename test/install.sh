#!/usr/bin/env bash

set -e

repos=(
  junegunn/vader.vim
  jwalton512/vim-blade
  kana/vim-textobj-user
)

cd "$(dirname "$0")"
mkdir -p pack/blade/start
cd pack/blade/start

# When adding the plugin manually to &runtimepath, the plugin gets loaded
# before plugins in the 'pack' directory. Because this plugin depends on
# functionality from some plugins in the 'pack' directory, we'll add it
# to the pack like this.
ln -s ../../../.. vim-textobj-blade-directive

for repo in ${repos[@]}
do
  git clone https://github.com/$repo.git
done
