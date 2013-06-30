class FollowsController < ApplicationController
  respond_to :html, :js

  def create
    @user = User.find(params[:follow][:followable_id])
    current_user.follow(@user)
    respond_with @user
  end

  def destroy
    @user = User.find(params[:follow][:followable_id])
    current_user.stop_following(@user)
    respond_with @user
  end
end
