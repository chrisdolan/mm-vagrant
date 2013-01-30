#
# Author::  Mike Schuette
# Cookbook Name:: mm
# Recipe:: mm

# Everything in here is only intended for vagrant dev'ing.  Prod
# deploy should be done through scp.


# Disable iptables.  Don't do this in prod.
service "iptables" do
  action [:stop, :disable]
end


# Creature comforts

packages = [
  'vim',
  'screen',
  'telnet',
  'man',
  'curl',
  'wget',
  'ftp',
]

packages.each do |pkg|
  package pkg do
    action :install
  end
end


include_recipe "git"
include_recipe "build-essential::default"
include_recipe "php"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_php5"
if node['platform_family'] == "rhel"
  package "php-mysql" do
    action :install
  end
end

site_name = "match.makemusicny.com"


web_app site_name do
  server_name site_name
  server_aliases "dev.#{site_name}"
  docroot "/vagrant_site/app/webroot"
  allow_override "All"
end