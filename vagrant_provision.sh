# args
vm="vm_app"

# for centos-release-SCL
if [ -r /opt/rh/ruby193/enable ]; then
  source /opt/rh/ruby193/enable
  PATH=/opt/rh/ruby193/root/usr/local/bin:$PATH
fi

# depends install
if ! ( gem contents itamae ) < /dev/null > /dev/null 2>&1; then
  echo "- itamae depends library install...."
  yum install -y centos-release-SCL epel-release
  yum install -y ruby193 ruby193-ruby-devel git
  # for centos-release-SCL
  source /opt/rh/ruby193/enable
  PATH=/opt/rh/ruby193/root/usr/local/bin:$PATH
fi

# exec itamae
cd /vagrant
bundle install
bundle exec itamae local --node-json nodes/${vm}.json entrypoint.rb
