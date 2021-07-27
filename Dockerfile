FROM ruby:3.0.0-alpine

# 文字コード
ENV LANG=C.UTF-8

# タイムゾーン
ENV TZ=Asia/Tokyo

# alpine環境に必要なパッケージをインストール
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    gcc \
    g++ \
    libc-dev \
    libxml2-dev \
    linux-headers \
    make \
    mysql-client \
    mysql-dev \
    nodejs \
    nodejs-npm \
    tzdata \
    build-base \
    curl-dev \
    graphviz \
    yarn \
    shared-mime-info

RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# プロジェクトのコピー
WORKDIR  /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY . /app

# bundle install
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
CMD ["entrypoint.sh"]
EXPOSE 3000
