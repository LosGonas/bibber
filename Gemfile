ruby '2.0.0'

source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'mongo_mapper', :git => "git://github.com/mongomapper/mongomapper.git", :tag => "v0.13.0.beta2"
gem 'bson_ext'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end

group :test, :development do
  gem 'rspec-rails', '~> 3.0.0.beta'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'launchy'
  gem 'factory_girl_rails'
end
