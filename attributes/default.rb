## play::default
default['play']['version'] = "1.2.7"
default['play']['dir'] = "/opt/play"
default['play']['checksum'] = "b063d2d511955e07ff5ef64472a2a465aa2f267a8df73903552ba951995272fa"
default['play']['base_url'] = "http://downloads.typesafe.com/play/#{node['play']['version']}"

## play::user
default['play']['user'] = "play"
default['play']['group'] = "play"
default['play']['home'] = "/srv/play"

## play::source
default['play']['git_url'] = "git://github.com/playframework/play.git"
