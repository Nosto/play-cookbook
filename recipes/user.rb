#
# Cookbook Name:: play
# Recipe:: source
#
# Copyright 2012, Nosto Solutions Ltd
# Authors:
#       Jani Luostarinen <jani.luostarinen@nosto.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

group node['play']['group'] do
  group_name node['play']['group']
  system true
end

user node['play']['user'] do
  username node['play']['user']
  gid "#{node['play']['group']}"
  comment "Play Framework"
  system true
  home node['play']['home']
  shell "/bin/false"
end

directory node['play']['home'] do
  owner node['play']['user']
  group node['play']['group']
  mode "0777"
  action :create
  recursive true
end

template "/etc/profile.d/play.sh" do
  source "profile.d.play.erb"
  owner "root"
  group "root"
  mode 0644
  variables(:play_dir => node['play']['dir'])
end