require 'sinatra/base'
require (APP_DIR + 'controllers' + 'app_base.rb')

class App < AppBase
  get '/' do
    haml :index
  end

  get '/main-lang' do
    if params[:nick].nil? || params[:nick].empty?
      redirect '/', alert: "Invalid nickname"
    end

    begin
      repos = Github.repos.list user: params[:nick]
    rescue Github::Error::NotFound
      redirect '/', alert: "Nickname #{params[:nick]} does not exist"
    end
    langs = repos.map(&:language).reject(&:nil?)
    if langs.empty?
      redirect '/', alert: "No favorite language for #{params[:nick]}"
    end
    stat = Hash.new(0)
    langs.each do |v|
      stat[v] += 1
    end
    most_used = stat.select { |_,v| v == stat.values.max }.keys.join(',')
    redirect '/', notice: "Most favorite languages: #{most_used}"
  end
end