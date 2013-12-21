#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, Thomas Boerger
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node["memcached"]["packages"].each do |name|
  package name do
    action :install
  end
end

template node["memcached"]["sysconfig_file"] do
  source "sysconfig.conf.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["memcached"]
  )

  notifies :restart, "service[memcached]"
end

template node["memcached"]["config_file"] do
  source "memcached.conf.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["memcached"]
  )

  notifies :restart, "service[memcached]"

  not_if do
    node["memcached"]["config_file"].empty?
  end
end

service "memcached" do
  service_name node["memcached"]["service_name"]
  action [:enable, :start]
end
