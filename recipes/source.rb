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

include_recipe "git"
include_recipe "build-essential"
include_recipe "java"
include_recipe "play::user"

package "ant"

directory node['play']['dir'] do
  recursive true
  action :create
end

git node['play']['dir'] do
  repository node['play']['git_url']
  revision node['play']['version']
  action :sync
  depth 10
end

script "install_play" do
  interpreter "bash"
  cwd "#{node['play']['dir']}/framework"
  code <<-EOH
  ant
  EOH
end


