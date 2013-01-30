#
# Cookbook Name:: mm
# Recipe:: self_db
#
#
# NOTE: Don't simply add this recipe -- you must use the selfdb role
# to override the build_essential:compiletime attribute to true.




#Install mysqld and necessary ruby libs
include_recipe "mysql::ruby"
include_recipe "mysql::server"


db_conn_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']} #password is set in self_db attributes file


db_name = "matchmaker"
db_username = "matchusermaker"
db_password = "buildM@dison!"
db_sqlfile = "app/matchmaker_schema.sql"

# Create DB - not needed because the .sql contains 'CREATE DATABASE'
=begin
mysql_database db_name do
  connection db_conn_info
  action :create
end
=end

execute "restore db backup" do
  cwd '/vagrant_site'
  command "cat ./#{db_sqlfile} | mysql -u root -p#{node['mysql']['server_root_password']} && touch /tmp/dev.sql.restored"
  creates '/tmp/dev.sql.restored'
end

# Create user
mysql_database_user db_username do
  connection db_conn_info
  password db_password
  action :create
end

# Grant access
mysql_database_user db_username do
  connection db_conn_info
  password db_password
  database_name db_name
  host '%'
  action :grant
end

# Flush privileges
mysql_database "mysql" do
  connection db_conn_info
  sql "flush privileges"
  action :query
end

