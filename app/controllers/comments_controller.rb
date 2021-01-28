class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  

  def show
    @user = User.find_by(params[:id])
    @content = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @content = current_user.comments.build(content_params)
    if @content.save
      flash[:success] = "作品を投稿しました"
      redirect_to @content
    else
      @contents = current_user.comments.order(id: :desc).page(params[:page])
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @content = Comment.find(params[:id])
  end
  
  def update
    @content = current_user.comment.find(params[:id])
    @content.update(comment_params)
    redirect_to @content
  end
  
  def destroy
    @content.destroy
    flash[:success] = "作品を削除しました"
    redirect_back(fallback_location: new_comment_path)
  end
  
  
  private
  
  def content_params
    params.require(:comment).permit(:content, :image)
  end
  
  def correct_user
    @content = current_user.comments.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end