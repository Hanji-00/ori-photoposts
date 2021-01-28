class ToppagesController < ApplicationController
  
  def index
    if logged_in?
      @comments = current_user.comments.order(id: :desc).page(params[:page]).per(3)
      @user = current_user
    end
  end
  
end
