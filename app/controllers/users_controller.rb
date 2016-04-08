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
    @user = User.find(params[:user])
    if @user.blank?
      login_user(@user)
      redirect_to login_path
    else
      redirect_to dashboard_path
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
