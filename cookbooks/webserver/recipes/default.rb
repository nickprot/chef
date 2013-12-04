#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"

template "#{node['apache']['dir']}/sites-available/cvepatch" do

owner 'root'
group node['apache']['root_group']
mode '0644'
notifies :restart, 'service[apache2]'
end
 
apache_site 'cvepatch'

cookbook_file "#{node['apache']['dir']}/htpasswd" do
owner 'root'
group node['apache']['root_group']
mode '0644'
backup false
#content "admin:$apr1$ejZO6aAi$9zUZFyNxkX7pHOfqnjs8/0"
end