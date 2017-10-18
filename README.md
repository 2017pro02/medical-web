# README

[![CircleCI](https://circleci.com/gh/2017pro02/medical-web.svg?style=svg)](https://circleci.com/gh/2017pro02/medical-web)

## Setup
.envを作成して、以下の内容を置いてください。パスワードは変えてください。絶対Git管理下に置くなよ？？
```
POSTGRES_USER=foolog
POSTGRES_PASSWORD=password
```

以下のコマンドを実行してください。
```shell
docker-compose up -d                # PostgreSQLを立ち上げる
bundle install --path vendor/bundle # 依存するgemをインストールする
bundle exec rake db:setup           # データベースをセットアップする
bundle exec sidekiq -C config/sidekiq.yml # workerを立ち上げる
bundle exec rails s                 # 開発用サーバを立ち上げる
```

## Contributing
このプロジェクトをcloneしてbundle installし、「さぁ開発するぞ」と意気込むところ申し訳ありませんが、以下のコマンドを実行しておいてください。
```shell
bundle exec pre-commit install
git config pre-commit.ruby "bundle exec ruby"
```
