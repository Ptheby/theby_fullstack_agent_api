#!/usr/bin/env bash

set -o errexit


bundle install

chmod +x ./bin/rails


bundle exec rake db:migrate
