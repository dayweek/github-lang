require_relative '../test_helper'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def test_main_lang_success
    VCR.use_cassette('valid') do
      get '/main-lang', nick: 'dayweek'
      follow_redirect!
      assert last_response.ok?
      assert last_response.body.include?("Most favorite languages: JavaScript")
    end
  end

  def test_main_lang_invalid
    VCR.use_cassette('valid') do
      get '/main-lang', nick: ''
      follow_redirect!
      assert last_response.ok?
      assert last_response.body.include?("Invalid nickname")
    end
  end

  def test_main_lang_nonexisting
    VCR.use_cassette('valid') do
      get '/main-lang', nick: 'hausohseuoshs'
      follow_redirect!
      assert last_response.ok?
      assert last_response.body.include?("Nickname hausohseuoshs does not exist")
    end
  end
end