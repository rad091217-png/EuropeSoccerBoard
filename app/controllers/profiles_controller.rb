class ProfilesController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path
    else
      flash.now["danger"] = "自己紹介が入力されていません"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:introduction)
  end
end
