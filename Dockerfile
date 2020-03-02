FROM ruby:2.6.0
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client-9.6
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
ENV RAILS_ENV production
ENV BUILD_ENV true
ENV RAILS_LOG_TO_STDOUT true
RUN bundle install --without development test
ADD . /app
ENV HOME /app
RUN /bin/bash -l -c "bundle exec rails assets:precompile"

EXPOSE 80

CMD ["/bin/bash", "-l", "-c", "bundle exec rails server -b 0.0.0.0 -p 80"]
