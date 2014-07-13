#!/usr/bin/env bash

##
# Absurdly rough script for setting up dev environment in OS X.
##

# Check for homebrew dependencies
echo "Checking for homebrew..."
if ! type brew > /dev/null ; then
    echo "Install homebrew before proceeding:"
    echo 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)'
    exit 1
else
    echo "Updating homebrew..."
    brew update
fi

echo "Checking for apple-gcc42..."
if ! [[ `command brew ls apple-gcc42` =~ "apple-gcc42" ]] ; then
    echo "apple-gcc42 not found. Installing..."
    brew install apple-gcc42
fi

# Versions
RUBY_VER="2.1.2"

# Gemset
GEMSET_NAME="gameon-dev"

# RVM
echo "Checking for RVM..."
if ! command rvm 2>/dev/null ; then
    echo "RVM not installed. Installing..."
    curl -sSL https://get.rvm.io | bash -s stable
else
    echo "RMV already installed."
fi
source "$HOME/.rvm/scripts/rvm"

# Ruby
echo "Installing ruby-$RUBY_VER..."
rvm install $RUBY_VER

# Establish gemset
rvm use $RUBY_VER
if ! [[ `command rvm gemset list` =~ "$GEMSET_NAME" ]] ; then
    echo "Creating gemset $GEMSET_NAME..."
    rvm gemset create $GEMSET_NAME
fi
echo "Using gemset $GEMSET_NAME..."
rvm gemset use $GEMSET_NAME

# Bundler
echo "Installing bundler..."
gem install bundler
# Install gems
bundle install

echo ""
echo "$(tput setaf 1)You will need to add the following lines to your .bash_profile:$(tput sgr0)"
echo ""
echo "$(tput setaf 1)source $HOME/.rvm/scripts/rvm$(tput sgr0)"
echo "$(tput setaf 1)rvm use gameon-dev@2.1.2$(tput sgr0)"
