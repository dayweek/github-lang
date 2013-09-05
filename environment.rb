require "rubygems"
require "bundler"
APP_ENV = ENV['RACK_ENV'] || 'development'
Bundler.setup
Bundler.require :default, APP_ENV
require "pathname"
APP_DIR = Pathname.new(File.dirname(__FILE__)).realpath

Dir[APP_DIR.join('lib', '**/*.rb')].each { |file| require file }
Dir[APP_DIR.join('controllers', '**/*.rb')].each { |file| require file }