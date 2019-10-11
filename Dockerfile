FROM ruby:2.5.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/app
COPY . .

RUN gem install bundler \
    && bundle install

CMD bundle exec puma -C config/puma.rb