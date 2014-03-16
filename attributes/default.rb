default[:monit][:distr] = 'package' #can be source

default[:monit][:source][:version] = '5.7a'
default[:monit][:source][:checksum] = '38e09bd8b39abc59e6b9a9bb7a78f7eac2b02a92f4de1f3a6dc24e84dfedae0d'
default[:monit][:source][:url] = 'https://github.com/ezotrank/monit-src/archive/%s.tar.gz'
default[:monit][:source][:install_dir] = '/usr/local'

default[:monit][:bin] = '/usr/bin/monit'
default[:monit][:config] = '/etc/monitrc'
default[:monit][:config_d] = '/etc/monit.d'

default[:monit][:enable_notify] = true
default[:monit][:notify_email] = "notify@example.com"
default[:monit][:logfile] = 'syslog facility log_daemon'
default[:monit][:poll_period] = 60
default[:monit][:poll_start_delay] = 120

default[:monit][:mail_format][:subject] = "$SERVICE $EVENT"
default[:monit][:mail_format][:from] = "monit@#{node['fqdn']}"
default[:monit][:mail_format][:message] = <<-EOS
Monit $ACTION $SERVICE at $DATE on $HOST: $DESCRIPTION.
Yours sincerely,
monit
EOS

default[:monit][:mailserver][:host] = "localhost"
default[:monit][:mailserver][:port] = nil
default[:monit][:mailserver][:username] = nil
default[:monit][:mailserver][:password] = nil
default[:monit][:mailserver][:password_suffix] = nil

default[:monit][:port] = 3737
default[:monit][:address] = 'localhost'
default[:monit][:ssl] = false
default[:monit][:cert] = '/etc/monit/monit.pem'
default[:monit][:allow] = ['localhost']
