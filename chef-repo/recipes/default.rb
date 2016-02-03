#
# Cookbook Name:: chef-repo
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


# serverspecのパッケージをインストール
# gem_package 'serverspec'
# package 'rake'

# pipのパッケージで必要なものをインストール
bash "install nodejs npm packages" do
  cwd "/home/vagrant"
  user "root"
  code <<-EOH

  EOH
end