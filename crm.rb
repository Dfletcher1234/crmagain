require_relative 'contact'
require 'sinatra'

get '/'do
@contactspage = '/contacts'
@aboume = '/about'

  erb :index
end

get '/home' do
erb :index
end

get '/contacts/new' do
  erb :new
end

get '/about' do
  @contactspage = '/contacts'
  @home_page = '/'
erb :about
end


get '/contacts' do
  @contacts = Contact.all
  @size = Contact.all.size
  @home_page = '/'
  @aboutme = '/about'
  erb :contacts
end

get '/contacts/:id' do
  @home_page = '/'
  @aboutme = '/about'
  @contacts = Contact.find_by({id: params[:id].to_i})
  @contactspage = '/contacts'
  if @contact
  erb :show_contact
else
    raise Sinatra: :Notfound
  end
end

get '/about' do
  @contacts_page = '/contacts'
  @home_page = '/'
erb :about

end


after do
  ActiveRecord::Base.connection.close
end
