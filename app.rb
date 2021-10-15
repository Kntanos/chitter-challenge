require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
    configure :development do
      register Sinatra::Reloader
    end

  get '/' do
    "Hello World"
  end


  run! if app_file ==$0
end