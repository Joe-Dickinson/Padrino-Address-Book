PadrinoAddressBook::App.controllers :person do
  

  layout :main

  before do
    redirect '/person/login' unless session[:logged_in] || request.fullpath == '/person/login'
    env["PATH_INFO"] == '/person/login'
  end

  get :login do
    render 'person/login', :layout => false
  end

  post :login do
    person = Person.find_by_email(params[:email])
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
    p = Person.find(params[:person][:_id])
    p.update_attributes(params[:person])
    flash_tag(:notice, :id => 'Updated!')
    flash[:notice] = "Saved!"
  end

  get :search, :with => :letter, :map => '/person/find' do
    @people = Person.find_by_letter(params[:letter])
    render 'person/index'
  end

  get :new, :map => '/person/new' do
    @person = Person.new
    render 'person/new'
  end
end
