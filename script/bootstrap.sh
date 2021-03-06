#!/bin/sh -xe

if ! which mysql > /dev/null; then
  echo 'ERROR mysql does not be installed. Please install mysql.'
fi

bundle install --path vendor/bundle --binstubs vendor/bundle/bin --jobs 4
rake db:setup
