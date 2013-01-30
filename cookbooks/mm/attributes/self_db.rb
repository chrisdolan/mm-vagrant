override['mysql']['server_root_password'] = 's00per'
override['mysql']['use_upstart'] = false
override['mysql']['tunable']['wait_timeout']         = "28800" #8 hours, which is mysql default, which is RDS default

#needed for chef-solo
override['mysql']['server_debian_password'] = 's00per'
override['mysql']['server_repl_password'] = 's00per'

override['mysql']['bind_address'] = '0.0.0.0' #need this to allow connections to 'localhost'