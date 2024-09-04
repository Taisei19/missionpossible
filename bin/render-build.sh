#!/usr/bin/env bash
# exit on error
rm -rf tmp/cache

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate