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

  def new
    @new_user = User.new
  end

  def save_new
    email = params["users"]["email"]
    password = BCrypt::Password.create(params["users"]["password"])
    @new_user = User.create({"email" => email, "password" => password})

    if @new_user.valid?
      session[:user_id] = @new_user.id
      redirect_to "/users/#{@new_user.id}"
    else
      render "/users/new"
    end
  end

  def delete
  end

  def confirm_delete
    if params["confirm_delete"] == "yes"
      user = User.find(session[:user_id])
      user.delete
      session[:user_id] = nil
      redirect_to "/users"
    else
      redirect_to "/users"
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def save_edit
    @user = User.find(params["id"])
    @user.email = params["users"]["email"]
    encrypted_password = BCrypt::Password.create(params["users"]["password"])
    @user.password = encrypted_password
    @user.save

    if !@user.valid?
      @user
      render "/users/edit"
    else
      redirect_to "/users"
    end
  end

end
