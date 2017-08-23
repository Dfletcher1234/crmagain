require_relative 'contact'
require 'sinatra'



get '/home' do
erb :index
end

get '/contacts' do
erb :contacts
@contacts = [crm.sqlite3]
end

get '/about' do
erb :about
end





after do
  ActiveRecord::Base.connection.close
end
