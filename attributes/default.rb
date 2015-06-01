## play::default
default['play']['version'] = "1.3.1"
default['play']['dir'] = "/opt/play"
default['play']['checksum'] = "a94482e6fc7799ef0e758acf3b53d2b54243f0d4b6f9d5f9652030659529418c"
default['play']['base_url'] = "http://downloads.typesafe.com/play/#{node['play']['version']}"

## play::user
default['play']['user'] = "play"
default['play']['group'] = "play"
default['play']['home'] = "/srv/play"

## play::source
default['play']['git_url'] = "git://github.com/playframework/play1.git"
