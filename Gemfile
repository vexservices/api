source 'https://rubygems.org'

ruby '2.2.0'

# Rails
gem 'rails', '4.1.14'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'spring', group: :development

# Assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem 'therubyracer', platforms: :ruby
# Fix therubyracer on heroku
gem 'libv8', '3.16.14.3'

# Pagination
gem 'kaminari'

# Images
gem 'carrierwave'
gem 'rmagick', '2.13.2'
gem 'carrierwave_backgrounder'

# Money
gem 'money'

# Heroku
gem 'asset_sync'
gem 'fog'
gem 'newrelic_rpm'

# Jobs
gem 'sinatra', require: false
gem 'sidekiq'

# Geocoder
gem 'geocoder'

# Tree structure
gem 'ancestry'

# Search engine
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'

# Encrypt password
gem 'bcrypt'

# Push Notification
gem 'gcm'
gem 'houston', github: 'nomad/Houston'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'unicorn-worker-killer'
  gem 'dalli'
end

group :test, :development do
  gem "rspec-rails"
end

group :test do
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem 'rb-inotify', '~> 0.9'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'json-schema'
end
