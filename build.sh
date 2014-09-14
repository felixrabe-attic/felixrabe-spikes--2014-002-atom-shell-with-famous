#!/usr/bin/env bash

APP_NAME='Famous Atom'

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"
mkdir -p cache
cd cache

version=0.16.2
version="v$version"
zipfile="atom-shell-$version-darwin-x64.zip"
if [[ ! -f $zipfile ]] ; then
  curl -LO https://github.com/atom/atom-shell/releases/download/"$version"/"$zipfile"
fi

cd "$DIR"

# Cannot build in current directory:
# https://github.com/felixrabe-spikes/2014-001-atom-shell-zip-kills-sublime-text-on-osx
builddir=/tmp/atom-shell-build
rm -rf "$builddir"
mkdir -p "$builddir"
cd "$builddir"

unzip "$DIR"/cache/"$zipfile"
cp -a "$DIR/app" "$builddir"/Atom.app/Contents/Resources/app
mv "$builddir"/Atom.app "$builddir"/"$APP_NAME".app

echo "DONE: open '$builddir/$APP_NAME.app'"
