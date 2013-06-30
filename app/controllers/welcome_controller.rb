class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = current_user.feed
    end
    @user = User.new
  end
end
