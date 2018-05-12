#!/bin/bash

cd $HOME
if [ -d .vim/rc ]; then
  mkdir -p $HOME/.vim/rc
fi
ln -s $HOME/dotfiles/rc/dein.toml $HOME/.vim/rc/dein.toml
ln -s $HOME/dotfiles/rc/dein_lazy.toml $HOME/.vim/rc/dein_lazy.toml

