class UsersController < ApplicationController
  # 他のユーザーからのアクセスを制限
  before_action :is_matching_login_user, only: [:edit, :update]

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
    redirect_to user_path(@user.id) #redirect_to ユーザーの詳細ページへのパス
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  # 他のユーザーからのアクセスを制限するメソッドを作成
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end

end