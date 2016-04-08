class UsersController < ApplicationController
  include AssessmentHelpers::Authentication

  def new
    @user = User.new 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  def signin
    @user = User.new
  end

  def login
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_username(username).first
    if @user.blank?
      @user = User.new
      flash[:notice] = "Invalid username"
      render 'signin'
    else
      if confirm_user(@user, password)
        login_user(@user)
        redirect_to dashboard_path
      else
        flash[:notice] = "The username and password do not match"
        render 'signin'
      end
    end
  end

  def logout
    logout_user()
  end

  def edit
      
  end

  def update
      
  end

end
