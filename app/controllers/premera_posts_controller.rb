class PremeraPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @premera_posts = PremeraPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @premera_post = current_user.premera_posts.build()
  end

  def new
    @premera_post = PremeraPost.new
  end

  #投稿内容保存
  def create
    @premera_post = current_user.premera_posts.build(post_params)
    if @premera_post.save
      redirect_to premera_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "premera_posts/new"
    end
  end

  private

  def post_params
    params.require(:premera_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
