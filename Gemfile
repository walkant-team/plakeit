source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'haml-rails', '~> 0.9'
gem 'simple_form'
gem 'acts-as-taggable-on', '~> 3.4'
gem 'animate-rails' # use in landings
gem 'impressionist' # views_count
gem 'font-awesome-rails'

gem 'omniauth-facebook'
gem 'kaminari'

gem 'gmaps4rails'
gem 'underscore-rails'

gem 'refile', require: 'refile/rails'
gem 'refile-mini_magick'
gem 'refile-s3'

gem 'koala', '~> 2.2'
gem 'gon'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'capybara'
  gem 'poltergeist'
  gem 'dotenv-rails'
  gem 'rubocop', require: false
  gem 'pronto'
  gem 'pronto-rubocop', require: false
  gem 'pronto-flay', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
  gem 'letter_opener'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'guard-rspec', require: false
  gem 'fuubar'
  gem 'shoulda-matchers', '~> 3.1', require: false
  gem 'factory_girl_rails', require: false
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

# These gems are selectively required in production when we want to generate
# seed data. Normally, they are only used in test.
gem 'ffaker', require: false
