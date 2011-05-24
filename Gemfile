source 'http://rubygems.org'

gem 'rails', '3.0.7'
gem 'client_side_validations', '3.0.2'
gem 'kaminari'
gem 'compass'
gem 'devise'
gem 'jquery-rails'

group :test do
  gem 'factory_girl_rails'
  gem 'mocha', :require => false
  gem 'turn'
end

group :development do
  gem 'metric_fu', :require => false
end

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :production do
  gem 'mysql2'
end
