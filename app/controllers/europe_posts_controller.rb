class EuropePostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @europe_posts = EuropePost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @europe_post = current_user.europe_posts.build()
  end

  def new
    @europe_post = EuropePost.new
  end

  #投稿内容保存
  def create
    @europe_post = current_user.europe_posts.build(post_params)
    if @europe_post.save
      redirect_to europe_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "europe_posts/new"
    end
  end

  def destroy
    @europe_posts = EuropePost.paginate(page: params[:page]).order(created_at: :desc)
    if @europe_posts.user_id == current_user.id
      @europe_posts.destroy
      flash[:success] = "投稿を削除しました"
      redirect_back(fallback_location: "europe_post/index")
    end
  end

  private

  def post_params
    params.require(:europe_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
