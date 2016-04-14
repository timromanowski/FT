#!/bin/bash
export RBENV_ROOT="$HOME/.rbenv" RBENV_VERSION="2.3.0" RAILS_ENV="production" ; $HOME/.rbenv/bin/rbenv exec rails runner ./stattleship_loader.rb )