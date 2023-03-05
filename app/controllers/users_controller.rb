class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @post_images = @user.post_images  #ページネーションの為、下記に変更
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) # @user = ユーザーの取得
    @user.update(user_params) #@user.ユーザーのアップデート
    redirect_to user_path #redirect_to ユーザーの詳細ページへのパス
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end