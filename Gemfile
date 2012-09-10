source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'anjlab-bootstrap-rails', '>= 2.1', :require => 'bootstrap-rails'
gem 'bcrypt-ruby', '3.0.1'
gem 'rqrcode-rails3'
gem 'mini_magick'
gem "therubyracer", :group => :assets, :platform => :ruby
#For pagination of QR coes
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'

require 'open-uri'
gem 'rqrcode'
require 'base64'


group :development do
  gem 'sqlite3', '1.3.6'
  gem 'rspec-rails', '2.10.0'
  gem 'annotate', '~> 2.4.1.beta'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.2.4'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
end

group :production do
  gem 'thin'
  gem 'pg', '0.12.2'
  gem 'rspec-rails', '2.10.0'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'anjlab-bootstrap-rails', '>= 2.1', :require => 'bootstrap-rails'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
