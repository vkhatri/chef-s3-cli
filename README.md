s3_cli
=====

[![Cookbook](https://img.shields.io/github/tag/vkhatri/chef-s3-cli.svg)](https://github.com/vkhatri/chef-s3-cli) [![Build Status](https://travis-ci.org/vkhatri/chef-s3-cli.svg?branch=master)](https://travis-ci.org/vkhatri/chef-s3-cli)

Provides resources around awscli s3 commands.


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/s3_cli).


## Most Recent Release

```ruby
cookbook 's3_cli', '~> 1.0.1'
```


## From Git

```ruby
cookbook 's3_cli', github: 'vkhatri/chef-s3-cli',  tag: 'v1.0.1'
```


## Repository

```
https://github.com/vkhatri/chef-s3-cli
```


## Supported OS

- Amazon Linux
- CentOS


## Resources

- `s3_install` - install awscli pip module

- `s3_cp` - copy s3 local data


## Resource s3_install

**LWRP example**

```ruby
s3_install 'default'
```

**LWRP Options**

setup_epel_repo
- *action* (optional) - default `:install`, options: :install, :uninstall
- *setup_epel_repo* (optional, True/False)  - default `true`, include recipe yum-epel for centos & redhat platform


## Resource s3_cp

**LWRP example**
```ruby
s3_cp 'copy local file to s3' do
  s3_source '/tmp/object'
  s3_destination 's3://BUCKET/object'
end

s3_cp 'copy s3 to local directory' do
  s3_source's3://BUCKET/object'
  s3_destination '/tmp/'
end
```

**LWRP Options**

- *action* (optional) - default `:cp`, options: :cp
- *s3_source* (optional, String)  - default ``, aws s3 cp source
- *s3_destination* (optional, String)  - default ``, aws s3 cp destination
- *create_destination_dir* (optional, True/False)  - default `false`, creates s3 destination local path directory
- *username* (optional, String)  - default `nil`, user name to execute s3 command
- *groupname* (optional, String)  - default ``, group name to execute s3 command
- *s3_cli* (optional, String)  - default `nil`, awscli binary path
- *s3_cli_options* (optional, String)  - default ``, s3 cmd options
- *s3_cli_retries* (optional, Integer)  - default `3`, s3 cmd retries
- *s3_creates* (optional, String)  - default ``, s3 cmd guard to check if file exists


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`chef exec rake`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Contributors]: https://github.com/vkhatri/chef-s3-cli/graphs/contributors
