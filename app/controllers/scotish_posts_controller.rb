class ScotishPostsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]
  # 投稿一覧
  def index
    @scotish_posts = ScotishPost.paginate(page: params[:page]).order(created_at: :desc)
  end

  #投稿作成画面
  def show
    @scotish_post = current_user.scotish_posts.build()
  end

  def new
    @scotish_post = ScotishPost.new
  end

  #投稿内容保存
  def create
    @scotish_post = current_user.scotish_posts.build(post_params)
    if @scotish_post.save
      redirect_to scotish_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "scotish_posts/new"
    end
  end

  def destroy
    @scotish_post = ScotishPost.find(params[:id])
    @scotish_post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: "scotish_post/index")
  end

  private

  def post_params
    params.require(:scotish_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
