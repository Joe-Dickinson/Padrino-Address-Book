PadrinoAddressBook::App.controllers :person do
  

  layout :main

  before do
    #binding.pry
    redirect '/person/login' unless session[:logged_in] || request.fullpath == '/person/login'
    # env["PATH_INFO"] == '/person/login'
  end

  get :login do
    render 'person/login', :layout => false
  end

  post :login do
    person = Person.find_by_email(params[:email])
      # binding.pry
    if person && person.password == params[:password]
      session[:logged_in] = true
      redirect '/person'
    else
      flash_tag(:notice, :id => 'Record not found.')
      flash[:notice] = "Email and password do not match."
      render 'person/login', :layout => false
    end
  end

  get :index do
    @people = Person.all
    render 'person/index'
  end

  post :create, {:map => '/person/new'} do
    p = Person.new(params["person"])
    p.save
    flash_tag(:notice, :id => 'Entry Created!')
    flash[:notice] = "Entry Created!"
    redirect '/person/new'
  end

  get :edit, :with => :id, :map => '/person/edit' do
    @person = Person.find(params[:id])
    render 'person/edit'
  end

  put :update, :map => '/person' do
    binding.pry
    p = Person.find(params[:person][:_id])
    p.update_attributes(params[:person])
    binding.pry
    flash_tag(:notice, :id => 'Updated!')
    flash[:notice] = "Saved!"
    # redirect 'person/index'
    # /edit/#{p._id}
    # render 'person/index'
  end

  get :search, :with => :letter, :map => '/person/find' do
    @people = Person.find_by_letter(params[:letter])
    render 'person/index'
  end

  get :new, :map => '/person/new' do
    @person = Person.new
    render 'person/new'
  end

  # destroy :edit, :with => :id, :map => '/person' do
  #   @person = Person.find(params[:id])
    # @person.destroy
  # end



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
  

end
