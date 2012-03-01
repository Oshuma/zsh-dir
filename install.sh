#!/bin/bash

zsh_dir=$HOME/.zsh
zshrc=$HOME/.zshrc

if [[ -d $zsh_dir ]]; then
  echo "Directory '$zsh_dir' exists; returning..."
  exit 1
fi

echo -e "\n--- Installing to $zsh_dir ---\n"

git clone https://Oshuma@github.com/Oshuma/zsh-dir.git $zsh_dir
cd $zsh_dir

if [[ -L $zshrc ]]; then
  echo "Re-linking $zshrc"
  rm -vf $zshrc
fi
ln -s $zsh_dir/zshrc $zshrc

echo "\n--- Done ---\n"
