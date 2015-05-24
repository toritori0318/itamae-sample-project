include_recipe './attribute.rb'

group 'td-agent' do
  action [:create]
end

user 'td-agent' do
  system_user true
  gid     'td-agent'
  home     '/var/run/td-agent'
  password nil
  action   [:create]
end
execute "disable user shell" do
  command "usermod -s /sbin/nologin td-agent"
end

directory '/var/run/td-agent/' do
  owner  'td-agent'
  group  'td-agent'
  mode   '755'
  action :create
end

directory '/etc/td-agent/' do
  owner  'td-agent'
  group  'td-agent'
  mode   '755'
  action :create
end

# v1 yum.repo
template "/etc/yum.repos.d/treasure-data.repo" do
  source 'templates/repo.erb'
end

template "/etc/td-agent/td-agent.conf" do
  mode "0644"
  source "templates/td-agent.conf.erb"
  notifies :restart, "service[td-agent]"
  not_if "test -e /etc/td-agent/td-agent.conf"
end

if node["td_agent"]["includes"]
  directory "/etc/td-agent/conf.d" do
    mode "755"
  end
end

package "td-agent" do
  action :install
  version node["td_agent"]["version"]
end

if node["td_agent"]["plugins"]
  node["td_agent"]["plugins"].each do |plugin|
    plugin_name = "fluent-plugin-#{plugin}"
    execute "install #{plugin_name}" do
      command "/usr/lib64/fluent/ruby/bin/fluent-gem install #{plugin_name} --no-ri --no-rdoc"
      not_if "/usr/lib64/fluent/ruby/bin/fluent-gem contents #{plugin_name}"
    end
  end
end

service "td-agent" do
  action [ :enable, :restart ]
end
