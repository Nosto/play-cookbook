#
# Cookbook Name:: play
# Recipe:: default
#
# Copyright 2014, Nosto Solutions Ltd
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

include_recipe "java::default"
include_recipe "play::user"

package "unzip"

remote_file "#{Chef::Config['file_cache_path']}/play-#{node['play']['version']}.zip" do
  source      "#{node['play']['base_url']}/play-#{node['play']['version']}.zip"
  checksum    node['play']['checksum']
  owner       'root'
  group       'root'
  mode        0644
  action      :create_if_missing
end

bash 'play-install' do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
  unzip -nq play-#{node['play']['version']}.zip
  mv play-#{node['play']['version']} #{node['play']['dir']}-#{node['play']['version']}
  EOH
  action :run
  not_if { Dir.exists? "#{node['play']['dir']}-#{node['play']['version']}" }
end

link node['play']['dir'] do
  action :delete
end

link node['play']['dir'] do
  to "#{node['play']['dir']}-#{node['play']['version']}"
end
