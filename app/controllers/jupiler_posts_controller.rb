class JupilerPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @jupiler_posts = JupilerPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @jupiler_post = current_user.jupiler_posts.build()
  end

  def new
    @jupiler_post = JupilerPost.new
  end

  #投稿内容保存
  def create
    @jupiler_post = current_user.jupiler_posts.build(post_params)
    if @jupiler_post.save
      redirect_to jupiler_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "jupiler_posts/new"
    end
  end

  private

  def post_params
    params.require(:jupiler_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
