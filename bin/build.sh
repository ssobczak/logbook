#!/bin/bash
set -e

bundle exec jekyll build -s ./docs
bundle exec htmlproofer ./_site --disable-external
