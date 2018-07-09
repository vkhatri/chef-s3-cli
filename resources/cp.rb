resource_name :s3_cp

property :s3_source, String, required: true
property :s3_destination, String, required: true
property :create_destination_dir, [TrueClass, FalseClass], default: false
property :username, [String, NilClass], default: nil
property :groupname, [String, NilClass], default: nil
property :s3_cli, [String, NilClass], default: nil
property :s3_cli_options, String, default: ''
property :s3_cli_retries, Integer, default: 3
property :s3_creates, [String, NilClass], default: nil

default_action :cp

action :cp do
  directory new_resource.s3_destination do
    owner new_resource.username if new_resource.username
    group new_resource.groupname if new_resource.groupname
    recursive true
    only_if { new_resource.create_destination_dir }
  end

  aws_cli = value_for_platform(
    %w[centos redhat] => {
      'default' => '/usr/local/bin/aws',
      '>= 7' => '/bin/aws'
    },
    'amazon' => {
      '~> 2017' => '/usr/bin/aws',
      '~> 2018' => '/usr/bin/aws',
      '~> 2' => '/bin/aws'
    }
  )

  aws_s3_cli = aws_cli + ' s3'

  s3_cli = new_resource.s3_cli ? new_resource.s3_cli : aws_s3_cli
  s3_cmd = "#{s3_cli} cp #{new_resource.s3_source} #{new_resource.s3_destination} #{new_resource.s3_cli_options}"

  execute "copy #{new_resource.s3_source} to #{new_resource.s3_destination}" do
    retries new_resource.s3_cli_retries
    command s3_cmd
    user new_resource.username if new_resource.username
    group new_resource.groupname if new_resource.groupname
    creates new_resource.s3_creates if new_resource.s3_creates
  end
end
