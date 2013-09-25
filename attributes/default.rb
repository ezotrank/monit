default[:monit][:config]                = "/etc/monit.conf"
default[:monit][:config_d]              = "/etc/monit.d"

defailt[:monit][:enable_notify]         = true

default[:monit][:notify_email]          = "notify@example.com"

default[:monit][:logfile]               = 'syslog facility log_daemon'

default[:monit][:poll_period]           = 60
default[:monit][:poll_start_delay]      = 120

default[:monit][:mail_format][:subject] = "$SERVICE $EVENT"
default[:monit][:mail_format][:from]    = "monit@#{node['fqdn']}"
default[:monit][:mail_format][:message]    = <<-EOS
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
default[:monit][:address] = "localhost"
default[:monit][:ssl] = false
default[:monit][:cert] = "/etc/monit/monit.pem"
default[:monit][:allow] = ["localhost"]

# Nginx proxy
default[:monit][:http_proxy][:host_name]           = nil
default[:monit][:http_proxy][:listen_ports]        = [ 80 ]
default[:monit][:http_proxy][:host_aliases]        = []
default[:monit][:http_proxy][:basic_auth_username] = "monit"
default[:monit][:http_proxy][:basic_auth_password] = "monit"
