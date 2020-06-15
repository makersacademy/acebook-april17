source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end



gem 'coveralls', require: false
gem 'launchy'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
gem 'rails-controller-testing'
gem 'bcrypt'
# Use postgresql as the database for Active Record
gem 'pg'

gem 'pry'
# Use Puma as the app server

gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'

group :development, :test do

  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'flog'
  gem 'railroady'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'simplecov-console'
  gem 'timecop'
end

group :development do

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
