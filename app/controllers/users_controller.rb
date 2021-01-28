class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :followings, :followers, :images]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.page(params[:page]).per(10)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "編集を完了しました"
      redirect_to :user
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
       
  end
    
    
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(32)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(32)
    counts(@user)
  end
  
  def images
    @user = User.find(params[:id])
    @comments = @user.comments.page(params[:page]).per(10)
    counts(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction)
  end
  
  def correct_user
  @tanin = User.find(params[:id])
    if @tanin != current_user
      redirect_to root_url
    end
  end
  
end
