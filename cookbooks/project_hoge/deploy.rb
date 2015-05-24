app_root = "/app/hoge"

# create directory
directory app_root

# deploy
git "#{app_root}/current" do
  repository "https://github.com/toritori0318/drone-fig-ci-sample.git"
  revision "master"
end

# ...
