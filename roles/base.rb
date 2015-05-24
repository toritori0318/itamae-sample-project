## 全プロジェクト共通レシピは Itamae::Plugin を作ってインストールすると良いかも。
## もちろん、Pluginではなく普通にrecipesディレクトリに置いて実行してもOK
#include_recipe "company_base:packages"
#include_recipe "company_base:ntp"
#include_recipe "company_base:sysctl"
#include_recipe "company_base:security"
#include_recipe "company_base:ssh"
#include_recipe "company_base:sudo"

# プロジェクト独自のベースレシピ
include_recipe "../cookbooks/project_hoge/packages.rb"
