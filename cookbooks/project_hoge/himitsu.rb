require 'itamae/secrets'
# secretディレクトリが存在するとこを指定
node[:secrets] = Itamae::Secrets(File.join(__dir__, '../../secret'))

# Use it
p "================================================="
p node[:secrets][:himitsu_no_kagi]
p "================================================="
