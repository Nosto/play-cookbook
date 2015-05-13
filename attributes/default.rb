## play::default
default['play']['version'] = "1.3.1"
default['play']['dir'] = "/opt/play"
default['play']['checksum'] = "9dae87f659cca29cd0144ef58491b714072ccb786eef4ccfa7741da1a2301ec0"
default['play']['base_url'] = "http://downloads.typesafe.com/play/#{node['play']['version']}"

## play::user
default['play']['user'] = "play"
default['play']['group'] = "play"
default['play']['home'] = "/srv/play"

## play::source
default['play']['git_url'] = "git://github.com/playframework/play1.git"
