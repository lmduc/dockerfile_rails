FROM ruby:2.3.0

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# And remove the cache of apt-get update
RUN apt-get update && \
    apt-get install -qq -y build-essential nodejs --fix-missing --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.6

RUN gem install rails --version "$RAILS_VERSION"
