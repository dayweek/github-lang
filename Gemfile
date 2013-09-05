# define our source to loook for gems
source "http://rubygems.org/"
ruby "1.9.3"
gem 'sinatra', require: false
gem 'sinatra-flash', require: "sinatra/flash"
gem 'sinatra-redirect-with-flash', require: "sinatra/redirect_with_flash"
gem 'sinatra-twitter-bootstrap', require: 'sinatra/twitter-bootstrap'
gem 'rake'
gem 'haml'
gem 'github_api'

group :development do
  gem 'awesome_print'
  gem 'thin'
end

group :test do
  gem 'rack-test', require: 'rack/test'
  gem "vcr"
  gem "webmock", "~> 1.11.0" #required by vcr
end