source 'https://rubygems.org'

gem 'rails', '3.2.17'
gem 'sqlite3'
gem 'devise'
gem 'jquery-rails'
gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'
gem "draper"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end



group :development do
  gem "pry"
  gem "pry-rails"
end

group :test, :development do
  gem "rspec-rails"
  gem "cucumber-rails"
end

group :test do
  gem "database_cleaner"
  gem "spork"
  gem "guard-rspec"
  gem "guard-livereload"
  gem "guard-cucumber"
  gem "guard-spork"
  gem "email_spec"
  gem "factory_girl_rails"
end

group :production do
  gem 'therubyracer'
end
