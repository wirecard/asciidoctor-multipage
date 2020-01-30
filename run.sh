#!/bin/bash

VERSION="$1"
if [[ -z $VERSION ]]; then
  VERSION="2.0.10"
fi

gem install asciidoctor -v "$VERSION"
gem install concurrent-ruby

asciidoctor --version
asciidoctor -r ./asciidoctor-multipage.rb -b multipage_html5 \
  -a version="$VERSION" --trace test/sample.adoc > "${VERSION}.log"

DIR="docker/test-${VERSION}"
mkdir -p "$DIR"
cp test/*.html "$DIR"
