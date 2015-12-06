# args
vm="vm_app"

# ruby install
if ! ( which ruby ) < /dev/null > /dev/null 2>&1; then
  echo "- ruby and bundler install...."
  # packages
  yum install -y centos-release-SCL epel-release
  yum install -y wget rpm-build git readline-devel ncurses-devel gdbm-devel openssl-devel libyaml-devel libffi-devel zlib-devel
  # rpmbuild
  mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
  wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz -P /root/rpmbuild/SOURCES
  wget https://raw.githubusercontent.com/feedforce/ruby-rpm/master/ruby22x.spec -P /root/rpmbuild/SPECS
  rpmbuild -bb /root/rpmbuild/SPECS/ruby22x.spec
  # rpm ruby install
  rpm -Uvh /root/rpmbuild/RPMS/x86_64/ruby-2.2.3-1.el6.x86_64.rpm
  # bundler
  gem install bundler
fi

# exec itamae
cd /vagrant
bundle install
bundle exec itamae local --node-json nodes/${vm}.json entrypoint.rb
