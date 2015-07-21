class StoriesController < ApplicationController

  def index
    @user = User.find(params["user_id"])
    @user_stories = Story.where(user_id: @user.id)
    if @user.id == session[:user_id]
      @current_user = true
    else
      @current_user = false
    end
  end

end
