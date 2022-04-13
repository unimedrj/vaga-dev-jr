FROM ruby:2.6-alpine

LABEL Name=unimedrj-ruby Version=2.6

WORKDIR /app

RUN gem update bundler

RUN apk --update --upgrade --no-cache add \
    shared-mime-info \
    build-base \
    sqlite-dev \
    tzdata

RUN apk --update add less

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
