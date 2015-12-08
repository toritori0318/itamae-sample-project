app_root    = "/app/hoge"
app_root_c  = "#{app_root}/current"
target_repo = "https://github.com/toritori0318/drone-fig-ci-sample.git"

# create directory
directory app_root

target_branch = node['deploy']['revision'] || "master"
# git pull
execute "git checkout #{target_branch}" do
  command <<-"EOH"
set -e
export dir=#{app_root_c}
if [ -d $dir ]; then
    cd $dir
    git fetch origin
    git checkout #{target_branch}
    git reset --hard origin/#{target_branch}
else
    cd #{app_root}
    git clone #{target_repo} $dir
    cd $dir
    git checkout #{target_branch}
fi
EOH
end

# ...
