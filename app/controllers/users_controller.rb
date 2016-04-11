class UsersController < ApplicationController
  include AssessmentHelpers::Authentication

  before_action :check_authentication, only: [:logout, :edit, :update]

  def new
    flash[:notice] = nil
    @user = User.new 
  end

  def signup
    puts user_params
    @user = User.new(user_params)
    puts @user.attributes
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      puts @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  def signin
    flash[:notice] = nil
    @user = User.new
  end

  def login
    username = params[:user][:username]
    password = params[:user][:password]
    puts "before"
    puts User.all.map { |e| e.attributes }
    puts "after"
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
