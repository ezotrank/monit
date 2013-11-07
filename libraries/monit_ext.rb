module MonitExt
  class Chef::Resource
    def monit_bin
      node['monit']['distr'] == 'source' ? '/usr/local/bin/monit' : '/usr/bin/monit'
    end
  end
end