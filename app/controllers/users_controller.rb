class UsersController < ApplicationController

  def login
  end

  def authenticate_login
    entered_email = params["users"]["email"]
    @user_email = User.find_by(email: entered_email)

    if !@user_email.nil?
      @valid = true
      given_pw = params["users"]["password"]
      actual_pw = BCrypt::Password.new(@user_email.password)
      if actual_pw == given_pw
        session[:user_id] = @user_email.id
        render :"users/index"
      else
        @valid = false
        render :"users/login"
      end
    else
      @valid = false
      render :"users/login"
    end
  end

  def index
    if !params["log_out"].nil?
    session[:user_id] = nil
    # erb :"users/index"
    end
  # erb :"users/index"
  end

  

end
