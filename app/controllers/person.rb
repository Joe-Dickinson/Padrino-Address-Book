PadrinoAddressBook::App.controllers :person do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  # All routes on this controller use the main layout
  layout :main

  get '/index' do
    @people = Person.all
    render 'person/index'
  end

  get '/new' do
    #NOT erb :index!
    @person = Person.new
    render 'person/new', :layout => 'main'
  end

  post '/create' do
    #binding.pry
    p = Person.new(params["person"])
    p.save
    flash[:notice] = "Entry Created!"
    redirect '/person/new'
  end

  get '/edit', :with => :id do
    @person = Person.find(params[:id])
    render 'person/edit'
  end

  post '/update' do
    p = Person.find(params[:person][:id])
    p.update_attributes(params[:person])
    flash[:notice] = "Saved!"
    redirect '/person/#{p._id}'
  end

  get '/search', :with => :letter do
    @people = Person.find_by_letter(params[:letter])
    render 'person/index'
  end

end
