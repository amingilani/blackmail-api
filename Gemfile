# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# core
ruby '2.3.1'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# base app requirements
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rack-cors', require: 'rack/cors'
gem 'jbuilder', '~> 2.5'

# auth
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth'
gem 'pundit'

# extras
gem 'friendly_id'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'rack-livereload'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
