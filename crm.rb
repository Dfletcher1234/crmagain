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

  get '/about' do
    @contactspage = '/contacts'
    @home_page = '/'
  erb :about
  end


  post '/contacts' do
    Contact.create(first_name: params[:first_name],last_name: params[:last_name],email: params[:email],note: params[:note])
    redirect to '/contacts'

  end




  get'/contacts' do
  @contacts = Contact.all
  @size = Contact.all.size
  @home_page = '/'
  @aboutme = '/about'
  erb :contacts
end

  get '/contacts/new' do
    erb :new
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

  get '/contacts' do
    puts params
  end


  get '/contacts/:id/edit' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :edit_contact
    else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end




delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')

  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
