#
# Cookbook Name:: play
# Recipe:: source
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

include_recipe "git::default"
include_recipe "build-essential::default"
include_recipe "java::default"
include_recipe "play::user"

package "ant"

directory node['play']['dir'] do
  owner       "root"
  group       "root"
  mode        00755
  recursive   true
  action      :create
end

git node['play']['dir'] do
  repository  node['play']['git_url']
  revision    node['play']['version']
  action      :sync
  depth       10
  notifies    :run, "bash[play-install]", :immediately
end

bash 'play-install' do
  cwd         "#{node['play']['dir']}/framework"
  code <<-EOH
  ant jar
  EOH
  action      :run
end
