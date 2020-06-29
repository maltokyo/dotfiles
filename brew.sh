#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# zmalmark this one didnt accept the --with-default-names option: brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
# zmalmark this one didnt accept the --with-iri option: brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
# zmalmark didnt work with github desktop: brew install gnupg

# Install more recent versions of some macOS tools.
# zmalmark this one didnt accept the --with-override-system-vi option: brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

## zmalmark comment out this block until I understand it, all were uncommented
# # Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick # zmalmark this option didnt work even though it should according to the manual: --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli


# zmalmark binaries.
brew install fdupes


## zmalmark add my casks
brew install go
brew cask install google-chrome
brew cask install sublime-text
brew cask install keepassxc
brew cask install vlc
brew cask install github
brew cask install bbedit
brew cask install nextcloud
brew cask install balenaetcher
brew cask install calibre
brew cask install electrum
brew cask install gimp
brew cask install transmission
brew cask install darktable
brew cask install rawtherapee
brew cask install bisq
brew cask install adobe-creative-cloud

# zmalmark - My Transmit licence is version 4, so I can only get latest version of 4 which is 4.1.3
# download link broken so made my own tap on github - see next lines: brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/7019074dcb817227d41985b9e0768f11f8ce713a/Casks/transmit.rb
brew tap maltokyo/transmit4
brew cask install maltokyo/transmit4/transmit4

# zmalmark - get error when commiting to git using Git GUI, so need to run this as per here: https://github.com/desktop/desktop/issues/1391
git config --global commit.gpgsign false

#brew cask install virtualbox
#brew cask install virtualbox-extension-pack

# malmark for reading ext4 volumnes from here: https://www.maketecheasier.com/mount-access-ext4-partition-mac/
brew cask install osxfuse
brew install ext4fuse

# Remove outdated versions from the cellar.
brew cleanup
