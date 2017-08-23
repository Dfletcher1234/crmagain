require_relative 'contact'
require 'sinatra'



get '/home' do
erb :index
end

get '/contacts' do
erb :contacts
@contacts = Contact.all
end

get '/about' do
erb :about

end


after do
  ActiveRecord::Base.connection.close
end
