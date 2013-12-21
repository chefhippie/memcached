#
# Cookbook Name:: memcached
# Attributes:: default
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

case node["platform_family"]
when "debian"
  default["memcached"]["packages"] = %w(
    memcached
    libmemcache-dev
  )

  default["memcached"]["sysconfig_file"] = "/etc/default/memcached"
  default["memcached"]["config_file"] = "/etc/memcached.conf"
  default["memcached"]["user"] = "nobody"
  default["memcached"]["group"] = false
when "ubuntu"
  default["memcached"]["packages"] = %w(
    memcached
    libmemcache-dev
  )

  default["memcached"]["sysconfig_file"] = "/etc/default/memcached"
  default["memcached"]["config_file"] = "/etc/memcached.conf"
  default["memcached"]["user"] = "nobody"
  default["memcached"]["group"] = false
when "suse"
  default["memcached"]["packages"] = %w(
    memcached
    libmemcached-devel
  )

  default["memcached"]["sysconfig_file"] = "/etc/sysconfig/memcached"
  default["memcached"]["config_file"] = ""
  default["memcached"]["user"] = "memcached"
  default["memcached"]["group"] = "memcached"
end

default["memcached"]["service_name"] = "memcached"
default["memcached"]["listen"] = "127.0.0.1"
default["memcached"]["port"] = 11211
default["memcached"]["memory"] = 128
default["memcached"]["maxconn"] = 1024
