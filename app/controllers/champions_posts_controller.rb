class ChampionsPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @champions_posts = ChampionsPost.paginate(page: params[:page]).order(created_at: :desc)
  end

  #投稿作成画面
  def show
    @champions_post = current_user.champions_posts.build()
  end

  def new
    @champions_post = ChampionsPost.new
  end

  #投稿内容保存
  def create
    @champions_post = current_user.champions_posts.build(post_params)
    if @champions_post.save
      redirect_to champions_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "champions_posts/new"
    end
  end

  def destroy
    @champions_posts = ChampionsPost.paginate(page: params[:page]).order(created_at: :desc)
    if @champions_posts.user_id == current_user.id
      @champions_posts.destroy
      flash[:success] = "投稿を削除しました"
      redirect_back(fallback_location: "champions_post/index")
    end
  end

  private

  def post_params
    params.require(:champions_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
