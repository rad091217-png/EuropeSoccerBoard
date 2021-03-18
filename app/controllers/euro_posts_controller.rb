class EuroPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @euro_posts = EuroPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @euro_post = current_user.euro_posts.build()
  end

  def new
    @euro_post = EuroPost.new
  end

  #投稿内容保存
  def create
    @euro_post = current_user.euro_posts.build(post_params)
    if @euro_post.save
      redirect_to euro_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "euro_posts/new"
    end
  end

  private

  def post_params
    params.require(:euro_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
