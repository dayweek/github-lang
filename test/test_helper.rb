ENV['RACK_ENV'] = 'test'
require_relative '../environment.rb'
require 'test/unit'

VCR.configure do |c|
  c.cassette_library_dir = APP_DIR + 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end