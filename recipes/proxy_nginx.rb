#
# Cookbook Name:: monit
# Recipe:: proxy_nginx
#
# Author:: Maxim Kremenev <ezo@kremenev.com>
#
# Copyright 2013, Maxim 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in wrhiting, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "nginx::source"

host_name = node['monit']['http_proxy']['host_name']

template "#{node['nginx']['dir']}/sites-available/monit.conf" do
  source      "nginx_monit.conf.erb"
  owner       'root'
  group       'root'
  mode        '0644'
  variables(
  :host_name        => host_name,
  :host_aliases     => node['monit']['http_proxy']['host_aliases'],
  :listen_ports     => node['monit']['http_proxy']['listen_ports'],
  )

  if File.exists?("#{node['nginx']['dir']}/sites-enabled/monit.conf")
    notifies  :restart, 'service[nginx]'
  end
end

nginx_site "monit.conf" do
  if node['monit']['http_proxy']['variant'] == "nginx"
    enable true
  else
    enable false
  end
end
