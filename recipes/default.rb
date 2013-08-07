#
# Cookbook Name:: play
# Recipe:: default
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

include_recipe "java"
include_recipe "play::user"

package "unzip"

directory node['play']['dir'] do
  recursive true
  action :delete
end

remote_file "#{Chef::Config['file_cache_path']}/play-#{node['play']['version']}.zip" do
  source "#{node['play']['base_url']}/#{node['play']['version']}/play-#{node['play']['version']}.zip"
  checksum node['play']['checksum']
  action :create_if_missing
end

bash "install_play" do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    unzip -q play-#{node['play']['version']}.zip
    mv play-#{node['play']['version']} #{node['play']['dir']}
  EOH
end
