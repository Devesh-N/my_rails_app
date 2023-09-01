# Stage 1: Install Ruby and build dependencies
FROM ruby:2.7.0 AS builder

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Create a directory for the application and use it
WORKDIR /app

# Install Ruby gems
COPY Gemfile* ./
RUN bundle install

# Stage 2: Copy the code and assets and set environment variables
FROM ruby:2.7.0

# Again, install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Set an environment variable to store where the app is installed to inside the Docker image
ENV RAILS_ROOT /app

# Set working directory
WORKDIR $RAILS_ROOT

# Copy from the builder stage the installed gems into this stage
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

# Copy the application code into the image
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Set Rails to run in production
ENV RAILS_ENV production
ENV RACK_ENV production

# Start the application server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
