FROM ruby:alpine

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec ruby main.rb
