#
# Cookbook:: s3_cli
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

s3_install 'default'

s3_cp 'download object' do
  s3_source 's3://s3-bucket/object'
  s3_destination '/tmp/'
  s3_creates '/tmp/object'
  s3_umask 600
  action :nothing
end

s3_cp 'upload object' do
  s3_source '/tmp/object'
  s3_destination 's3://s3-bucket/object'
  s3_umask 600
  action :nothing
end
