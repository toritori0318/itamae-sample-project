Itamaeのサンプルプロジェクトです

## ディレクトリ構造

### プロジェクト全体

```
PROJECT_ROOT/
  nodes/        # vm毎のnode.json
  recipes/      # レシピ群
  roles/        # ロール群
  entrypoint.rb # Itamaeから実行されるレシピのエントリポイント(後程説明)
  Gemfile       # Itamaeプラグインなどの依存が書かれたGemfile
```

### レシピ毎

```
<recipe_name>
  attributes.rb   # attributesをまとめたファイル
  xxx_recipe.rb   # なんかレシピ
  yyy_recipe.rb   # なんかレシピ
  templates/      # テンプレートファイル
    xxx.conf.erb
```
