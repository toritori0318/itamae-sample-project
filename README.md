Itamaeのサンプルプロジェクトです

## 試してみる

```
git clone https://github.com/toritori0318/itamae-sample-project.git
cd itamae-sample-project

vagrant up vm_app
```

## ディレクトリ構造

### プロジェクト全体

```
PROJECT_ROOT/
  cookbooks/    # クックブック群
  nodes/        # vm毎のnode.json
  roles/        # ロール群
  entrypoint.rb # Itamaeから実行されるレシピのエントリポイント(後程説明)
  Gemfile       # Itamaeプラグインなどの依存が書かれたGemfile
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
