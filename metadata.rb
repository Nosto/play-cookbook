name             "play"
maintainer       "Jani Luostarinen"
maintainer_email "jani.luostarinen@nosto.com"
license          "Apache 2.0"
description      "Installs Play Framework"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "play::default", "Installs play from binary"
recipe "play::source", "Installs play from source"
recipe "play::user", "Adds play user & group"

depends          "java"
depends          "git"
depends          "build-essential"
