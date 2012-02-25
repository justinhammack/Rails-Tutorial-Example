source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'will_paginate', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'

  # allows us to make sample users
  gem 'faker', '1.0.1'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  # creates commented notes on model attributes
  gem 'annotate', '~> 2.4.1.beta'
end


group :test do
  # test specs, capybara for forms/acceptance, factory girl for modeling
  gem 'rspec-rails', '2.8.1'
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'

  # loads guards for automated testing
  gem 'guard-rspec', '0.5.5'                      
  gem 'guard-spork', '0.3.2'

  # watches file changes
  gem 'rb-fsevent', '0.4.3.1', :require => false  
  
  # faster pre-fork testing 
  gem 'spork', '~> 0.9.0.rc'
  
  # testing notifications
  gem 'growl'  
end


# jQuery for RoR
gem 'jquery-rails'

# Use unicorn as the web server
gem 'unicorn'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
