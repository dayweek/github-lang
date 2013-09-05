# config.ru
require './environment'

map '/' do
  run App
end