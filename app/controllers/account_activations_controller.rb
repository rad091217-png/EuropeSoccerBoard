class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash.now[:success] = "あなたのアカウントは有効化されました"
      redirect_to user
    else
      flash.now[:danger] = "アカウント有効化に失敗しました"
      redirect_to root_url
    end
  end
end
