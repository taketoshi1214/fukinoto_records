# アプリ名 Fukinoto Records

# 説明

# 使い方

  管理者アカウント

  ・商品出品機能
    商品の出品ができます。
  ・商品編集機能
    出品した商品の編集ができます。
  ※ローカルでの
  http://localhost:3000/admins
  購入用アカウント新規登録ページ

  http://localhost:3000/users/sign_up

  http://localhost:3000/users/sign_in

# 構築やインストール方法

ターミナルまたはコマンドプロンプトにて以下のコマンドを順番に実行してください。

  git clone https://github.com/taketoshi1214/fukinoto_records.git
  cd 任意のディレクトリ(フォルダ)を指定してください。
  bundle installrails 
  db:createrails 
  db:migrate
  rails s

  上記のコマンドを実行後、以下のURLでアクセス可能です。
  
  http://localhost:3000
