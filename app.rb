require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/peep'

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

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    flash[:notice] = "Sign up succesful"
    redirect :'user/new'
  end

  run! if app_file ==$0
end