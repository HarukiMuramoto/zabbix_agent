#
# Cookbook Name:: zabbix_agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
## zabbix-agent
bash "zabbix repos" do
    user "root"
    code <<-EOS
    rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
  EOS
end
           
package "zabbix-agent" do
  action :upgrade
end
              
template "/etc/zabbix/zabbix_agentd.conf" do
   path "/etc/zabbix/zabbix_agentd.conf"
   owner "root"
   source "zabbix_agentd.conf.erb"
end
                     
service "zabbix-agent" do
  action :restart
end

