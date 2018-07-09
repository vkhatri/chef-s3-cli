resource_name :s3_install

property :setup_epel_repo, [TrueClass, FalseClass], default: true

default_action :install

action :install do
  python_packages = value_for_platform(
    %w[centos redhat] => { '>= 7' => %w[python-devel python2-pip], 'default' => %w[python2-devel python2-pip] },
    'amazon' => {
      '~> 2017' => %w[python27-devel python27-pip],
      '~> 2018' => %w[python27-devel python27-pip],
      '~> 2' => %w[python-devel python2-pip]
    }
  )

  pip_binary = value_for_platform(
    %w[centos redhat] => { '~> 6' => '/usr/bin/pip', 'default' => '/bin/pip' },
    'amazon' => {
      '~> 2017' => '/usr/bin/pip',
      '~> 2018' => '/usr/bin/pip',
      '~> 2' => '/bin/pip'
    }
  )

  aws_binary = value_for_platform(
    %w[centos redhat] => { '~> 6' => '/usr/bin/aws', 'default' => '/bin/aws' },
    'amazon' => {
      '~> 2017' => '/usr/local/bin/aws',
      '~> 2018' => '/usr/local/bin/aws',
      '~> 2' => '/bin/aws'
    }
  )

  include_recipe 'yum-epel' if new_resource.setup_epel_repo && %w[centos redhat].include?(node['platform'])

  package python_packages

  execute 'install pip awscli' do
    command "#{pip_binary} install awscli"
    not_if { ::File.exist?(aws_binary) }
  end
end

action :uninstall do
  package 'aws-cli' do
    action :remove
  end
end
