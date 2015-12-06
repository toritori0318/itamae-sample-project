Itamaeのサンプルプロジェクトです（itamae-secretバージョン）

## 試してみる

### itamae-secrets 事前準備

```
# itamae-secretsをローカルでインストールしとく
gem install itamae-secrets

# キーを作成。このプロジェクトのキーは「hoge」です
itamae-secrets newkey --method=aes-passphrase
```

### vagrant up

```
git clone https://github.com/toritori0318/itamae-sample-project.git
cd itamae-sample-project
git checkout itamae-secrets-version

# vagrant up
#  himitsu.rb の実行結果で「blahblahblah」が出力されたら成功！！！
vagrant up vm_app
```

## ディレクトリ構造

### プロジェクト全体

```
PROJECT_ROOT/
  cookbooks/          # クックブック群
  nodes/              # vm毎のnode.json
  roles/              # ロール群
  secret/             # itamae-secretsの秘密の入れ物
  .itamae-secrets.yml # itamae-secrets のディレクトリが指定されるコンフィグファイル
  entrypoint.rb       # Itamaeから実行されるレシピのエントリポイント(後程説明)
  Gemfile             # Itamaeプラグインなどの依存が書かれたGemfile
```

### クックブック毎

```
<cookbook_name>
  attributes.rb   # attributesをまとめたファイル
  xxx_recipe.rb   # なんかレシピ
  yyy_recipe.rb   # なんかレシピ
  templates/      # テンプレートファイル
    xxx.conf.erb
```
