class EredivisiePostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @eredivisie_posts = EredivisiePost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @eredivisie_post = current_user.eredivisie_posts.build()
  end

  def new
    @eredivisie_post = EredivisiePost.new
  end

  #投稿内容保存
  def create
    @eredivisie_post = current_user.eredivisie_posts.build(post_params)
    if @eredivisie_post.save
      redirect_to eredivisie_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "eredivisie_posts/new"
    end
  end

  private

  def post_params
    params.require(:eredivisie_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
