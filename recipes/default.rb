include_recipe "yum::epel"

package "monit"

template '/etc/init.d/monit' do
  owner  'root'
  group 'root'
  mode 00755
  action :create
  source 'monit_init.erb'
end

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
  notifies :reload, resources(:service => "monit"), :delayed
end
