## play::default
default['play']['version'] = "1.2.6"
default['play']['dir'] = "/opt/play"
default['play']['checksum'] = "1c48944fdc7975a5a0a09d9166cef4e0aa63c5b07d52f5fa683a70a4387e6c05"
default['play']['base_url'] = "http://downloads.typesafe.com/play/#{node['play']['version']}"

## play::user
default['play']['user'] = "play"
default['play']['group'] = "play"
default['play']['home'] = "/srv/play"

## play::source
default['play']['git_url'] = "git://github.com/playframework/play.git"
