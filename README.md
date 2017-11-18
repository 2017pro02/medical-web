# README

[![CircleCI](https://circleci.com/gh/2017pro02/medical-web.svg?style=svg)](https://circleci.com/gh/2017pro02/medical-web)

## Setup
.envを作成して、以下の内容を置いてください。パスワードは変えてください。絶対Git管理下に置くなよ？？
```
POSTGRES_USER=foolog
POSTGRES_PASSWORD=password
```

このプロジェクトに必要なミドルウェアは以下の通り。
* docker, docker-compose
* anyenv[推奨] rbenv, ndenv
  * ruby2系, gem, bundler
  * node8系, yarn

以下のコマンドを実行してください。
```shell
docker-compose up -d db redis  #PostgreSQLを立ち上げる
bundle install --path vendor/bundle  #依存するgemをインストールする
bundle exec rake db:setup db:seed_fu  #データベースをセットアップする
bundle exec rake assets:precompile  #アセットを準備
bundle exec foreman start -p 3000  #プロセスを立ち上げる
```

### なんか上手くいかない場合
webpackerでコンパイルに失敗するなど、原因不明で最悪の場合は開発環境を全てDocker下に置く。
.envに以下を追記。
```
POSTGRES_HOST=db
REDIS_URL=redis://redis
```
`docker-compose up -d`でrubyコンテナを使用する。


## Contributing
このプロジェクトをcloneしてbundle installし、「さぁ開発するぞ」と意気込むところ申し訳ありませんが、以下のコマンドを実行しておいてください。
```shell
bundle exec pre-commit install
git config pre-commit.ruby "bundle exec ruby"
```
