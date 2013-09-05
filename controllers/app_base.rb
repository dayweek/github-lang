class AppBase < Sinatra::Base
  enable :sessions
  set :root, APP_DIR
  helpers Sinatra::RedirectWithFlash
  register Sinatra::Flash
  register Sinatra::Twitter::Bootstrap::Assets
end