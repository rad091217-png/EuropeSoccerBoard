class ProfilesController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to controller: :users, action: :update
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:introduction, :avatar_cache, :avatar)
  end
end
