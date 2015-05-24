%w{
  screen
}.each do |pkg|
  package pkg do
    action :install
  end
end
