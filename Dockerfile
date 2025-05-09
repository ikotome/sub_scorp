FROM ruby:3.

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /subscorp
WORKDIR /subscorp
COPY Gemfile /subscorp/Gemfile
COPY Gemfile.lock /subscorp/Gemfile.lock
RUN bundle install
COPY . /subscorp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3306

CMD ["rails", "server", "-b", "0.0.0.0"]

