# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH=$HOME/work/review/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$GOPATH/bin:~/pebble-dev/PebbleSDK-3.2/bin:/snap/bin
#source ~/.nvm/nvm.sh
#nvm use v0.12.4

source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
export WINEPREFIX=~/.wine
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PIPENV_VENV_IN_PROJECT=true
eval "$(pipenv --completion)"
export GST_ID3_TAG_ENCODING='CP932'
export PATH="$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$PATH"
