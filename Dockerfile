FROM ruby:3.1.2

WORKDIR /coTest

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

RUN gem install rails -v '7.0.7'

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]