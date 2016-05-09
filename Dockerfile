# Dockerfile references: https://docs.docker.com/engine/reference/builder

FROM ruby:2.3.0

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# And remove the cache of apt-get update
RUN apt-get update && \
    apt-get install -qq -y build-essential nodejs --fix-missing --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.6
ENV PG_VERSION 0.17.1
ENV HAML_VERSION 0.5.3
ENV NOKOGIRI_VERSION 1.6.7.2
ENV MINI_MAGICK_VERSION 3.7.0
ENV REDIS_OBJECTS_VERSION 1.2.1
ENV THERUBYRACER_VERSION 0.12.2
ENV FOG_VERSION 1.38.0

RUN gem install rails --version "$RAILS_VERSION"
RUN gem install pg --version "$PG_VERSION"
RUN gem install haml-rails --version "$HAML_VERSION"
RUN gem install nokogiri --version "$NOKOGIRI_VERSION"
RUN gem install mini_magick --version "$MINI_MAGICK_VERSION"
RUN gem install redis-objects --version "$REDIS_OBJECTS_VERSION"
RUN gem install therubyracer --version "$THERUBYRACER_VERSION"
RUN gem install fog --version "$FOG_VERSION"
