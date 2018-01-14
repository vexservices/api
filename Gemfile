source 'https://rubygems.org'

ruby '2.4.2'

# Rails
gem 'rails'
gem 'sdoc', group: :doc
gem 'spring', group: :development

# Assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'pg'
gem 'therubyracer', platforms: :ruby
# Fix therubyracer on heroku
gem 'libv8'

# Pagination
gem 'kaminari'

# Images
gem 'carrierwave'
gem 'rmagick'
gem 'carrierwave_backgrounder'

# Money
gem 'money'

# Heroku
gem 'asset_sync'
gem 'fog'

# Jobs
gem 'sinatra', require: false
gem 'sidekiq'
gem 'sidekiq-status'
gem 'redis-namespace'

# Geocoder
gem 'geocoder'

# Tree structure
gem 'ancestry'

# Search engine
gem 'ransack'

# Encrypt password
gem 'bcrypt'

# Push Notification
gem 'gcm'
gem 'houston', github: 'nomad/Houston'

group :production do
  gem 'rails_12factor'
  #gem 'unicorn'
  #gem 'unicorn-worker-killer'
  gem 'dalli'
end

group :test, :development do
  gem "rspec-rails"
end

group :test do
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem 'rb-inotify'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'json-schema'
end

gem 'figaro'
gem 'responders'

gem 'capistrano'
gem 'capistrano-rails'
gem 'capistrano-bundler'
