#!/usr/bin/env bash

APP_NAME='Famous Atom'

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

builddir=/tmp/atom-shell-build

coffee -bc --no-header "$DIR/app/src"
if [[ -d "$builddir"/"$APP_NAME".app/Contents/Resources/app ]] ; then
  rm -rf "$builddir"/"$APP_NAME".app/Contents/Resources/app
  cp -a "$DIR/app" "$builddir"/"$APP_NAME".app/Contents/Resources/app
else
  ./build.sh
fi

open "$builddir/$APP_NAME.app"
