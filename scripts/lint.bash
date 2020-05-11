  #!/usr/bin/env bash

  set -e

  cd "${0%/*}/.."

  echo "Running rubocop..."
  bundle exec rubocop -x
  git add . 
  git commit -m "Rubocopped some files"