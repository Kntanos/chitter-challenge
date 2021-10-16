require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/peep'
# require 'time'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
    configure :development do
      register Sinatra::Reloader
    end

  get '/' do
    erb :index
  end

  post '/peep/new' do
    Peep.create(content: params[:peep])
    redirect :'peep/index'
  end

  get '/peep/index' do
    @peeps = Peep.all
    erb :'peep/index'
  end

  run! if app_file ==$0
end