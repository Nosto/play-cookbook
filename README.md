Description
===========

Installs `play` framework from binary or source (tested with 1.x versions). 

Requirements
============

## Platform:

* Debian/Ubuntu

## Cookbooks:

* java
* git
* build-essential

Attributes
==========

See `attributes/default.rb` for default values.

* `node['play']['dir']` - Play install dir
* `node['play']['version']` Play version
* `node['play']['checksum']` Play package checksum
* `node['play']['base_url']` Play package base url
* `node['play']['user']` User for play
* `node['play']['group']` Group for play
* `node['play']['home']` Home for play user
* `node['play']['git_url']` Play git source url

Recipes
=======

default
-------

Include the default recipe in a run list, to get `play` framework from binary releases.

source
-------

This recipe installs `play` framework from source using git.


user
-------

Adds user and group for `play`. Included in default and source recipes. 


License and Author
==================

Author:: Jani Luostarinen (<jani.luostarinen@nosto.com>)

Copyright:: 2012, Nosto Solutions, Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
