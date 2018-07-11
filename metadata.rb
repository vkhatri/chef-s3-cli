name 's3_cli'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'aws cli s3 wrapper resources'
long_description 'aws cli s3 wrapper resources'
version '1.0.2'
chef_version '>= 12.14' if respond_to?(:chef_version)

issues_url 'https://github.com/vkhatri/chef-s3-cli/issues'
source_url 'https://github.com/vkhatri/chef-s3-cli'

depends 'yum-epel'

supports 'centos'
supports 'amazon'
