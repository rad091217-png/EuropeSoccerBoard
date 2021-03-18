class SeriePostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @serie_posts = SeriePost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @serie_post = current_user.serie_posts.build()
  end

  def new
    @serie_post = SeriePost.new
  end

  #投稿内容保存
  def create
    @serie_post = current_user.serie_posts.build(post_params)
    if @serie_post.save
      redirect_to serie_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "serie_posts/new"
    end
  end

  private

  def post_params
    params.require(:serie_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
