if platform?("centos")
  include_recipe "yum::epel"
end

package "monit"

service "monit" do
  action [:enable, :start]
  enabled true
  supports [:start, :restart, :stop, :reload]
end

directory node['monit']['config_d'] do
  owner  'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template node['monit']['config'] do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
  notifies :restart, resources(:service => "monit"), :delayed
end
