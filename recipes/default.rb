#
# Cookbook Name:: fusioninventory
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
#

tag = data_bag_item(node.chef_environment, 'fusioninventory')
server = data_bag_item('common', 'inventory_server')



windows_package node['fusioninventory']['package_name'] do
    source node['fusioninventory']['url']
    options " /tag=" +tag['domain']+ " /S /execmode=none /server="+server['address']+"/glpi/plugins/fusioninventory/front/plugin_fusioninventory.communication.php"
    installer_type :nsis
    action :install
end
