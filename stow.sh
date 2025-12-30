#!/bin/bash

cd  dotfiles;
for dir in $(ls); do
    stow $dir --target=$HOME;
done
cd ..;