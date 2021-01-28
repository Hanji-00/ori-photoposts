class PhotosController < ApplicationController
  before_action :require_user_logged_in
  
  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
  
  
  private
  
  def photo_params
    params.require(:photo).permit(:title, :image)
  end
  
end
