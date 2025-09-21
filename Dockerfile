FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  git \
  curl

# Install bundler
RUN gem install bundler

# Create working directory
WORKDIR /usr/src/app

# Copy Gemfile and install
COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
