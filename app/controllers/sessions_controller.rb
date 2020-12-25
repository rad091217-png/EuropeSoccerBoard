class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # ユーザーがデータベースにあり、認証に成功
    if @user && @user.authenticate(params[:session][:password])
      login @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash.now[:success] = "ログアウトしました"
  end
end
