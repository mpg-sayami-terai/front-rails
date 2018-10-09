# [FROM]ベースのイメージ指定
FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
# [WORKDIR]作業ディレクトリの指定
WORKDIR /myapp
# [ADD]ホストのファイル・ディレクトリをコンテナ上のファイルパス以下に追加
# ADD ホストのファイルパス コンテナのファイルパス
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
# 【TODO】↑のRUNはイメージ上で実行されているが、
#        bundle installでできた物理ファイルはホストにできるのでコンテナ上へコピーする必要がある？
ADD . /myapp