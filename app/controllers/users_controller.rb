class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  # before_action :logged_in_user, only: [:edit, :update]
  
  def show
    # @user = User.find(params[:id])
    @user = current_user
  end
  
  def edit
    # @user = User.find(id: params[:id])
    @user = current_user
  end
  
  def update
    @user = current_user
    # @user = User.find(params[:id])
    if @user.image && @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to users_profile_path
    else
      render :edit
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:image, :name, :introduction)
    end
    
    # ログイン済みユーザーかどうか確認
    # def logged_in_user
    #   unless logged_in?
    #     flash[:danger] = "Please log in."
    #     redirect_to root_path
    #   end
    # end
end
