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

  def new
    user = User.find(session[:user_id])
    @new_story = Story.new
    @route_path = '/users/' + user.id.to_s + '/stories'
  end

  def new_save
    @user = User.find(session[:user_id])
    title = params["stories"]["title"]
    summary = params["stories"]["summary"]
    @new_story = Story.create({"title" => title, "summary" => summary, "user_id" => @user.id})

    if @new_story.valid?
      redirect_to "/users/#{@user.id}/stories/#{@new_story.id}"
    else
      render "/stories/new"
    end
  end

  def delete
    @user = User.find(session[:user_id])
    story_id = Story.find(params["stories"]["id"])
    story_id.delete
    redirect_to "/users/#{@user.id}/stories"
  end

  def edit
    @user = User.find(session[:user_id])
    @story = Story.find(params["stories"]["id"])
    @route_path = '/users/' + @user.id.to_s + '/stories/' + @story.id.to_s
  end

  def edit_save
    @user = User.find(session[:user_id])
    @story = Story.find(params["id"])
    @story.title = params["stories"]["title"]
    @story.summary = params["stories"]["summary"]
    @story.save

    if !@story.valid?
      @story
      render "/stories/edit"
    else
      redirect_to "/users/#{@user.id}/stories"
    end
  end

end
