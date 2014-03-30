url = node[:monit][:source][:url] % node[:monit][:source][:version]
file = 'monit-%s' % node[:monit][:source][:version]

remote_file "#{Chef::Config[:file_cache_path]}/#{file}.tar.gz" do
  source url
  checksum node[:monit][:source][:checksum]
  mode 0755
  notifies :run, 'bash[install_monit_source]', :immediately
  not_if "test `#{node[:monit][:bin]} -V|head -n 1|awk '{print $5}'` = #{node[:monit][:source][:version]}"
end

bash 'install_monit_source' do
  cwd "#{Chef::Config[:file_cache_path]}"
  # action :nothing
  code <<-EOH
  tar xvf #{file}.tar.gz && cd monit-src-#{node[:monit][:source][:version]}
  ./configure --without-pam --prefix=#{node[:monit][:source][:install_dir]} && make && make install
  sed --in-place '116,121d;' monitrc
  cp -rf monitrc #{node[:monit][:config]} && chmod 0700 #{node[:monit][:config]}
  EOH
  not_if "test `#{node[:monit][:bin]} -V|head -n 1|awk '{print $5}'` = #{node[:monit][:source][:version]}"
end