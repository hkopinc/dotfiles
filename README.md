Dotfiles
========

Installation
------------

With Git:

    git clone git://github.com/hkopinc/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    bash install.sh

Without Git:

    cd $HOME
    mkdir -p .dotfiles
    curl -# -L -k https://github.com/hkopinc/dotfiles/tarball/master | tar xz --strip 1 -C .dotfiles
    cd .dotfiles
    bash install.sh
