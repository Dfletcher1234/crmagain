require_relative 'contact'
require 'sinatra'

get '/'do
  erb :index
end

get '/home' do
erb :index
end

get '/contact' do
erb :contacts
# @contacts = Contact.all
end

get '/about' do
erb :about

end


after do
  ActiveRecord::Base.connection.close
end
