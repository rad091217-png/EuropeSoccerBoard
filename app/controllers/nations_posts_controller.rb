class NationsPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @nations_posts = NationsPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @nations_post = current_user.nations_posts.build()
  end

  def new
    @nations_post = NationsPost.new
  end

  #投稿内容保存
  def create
    @nations_post = current_user.nations_posts.build(post_params)
    if @nations_post.save
      redirect_to nations_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "nations_posts/new"
    end
  end

  def destroy
    @nations_posts = NationsPost.paginate(page: params[:page]).order(created_at: :desc)
    if @nations_posts.user_id == current_user.id
      @nations_posts.destroy
      flash[:success] = "投稿を削除しました"
      redirect_back(fallback_location: "nations_post/index")
    end
  end

  private

  def post_params
    params.require(:nations_post).permit(:title, :text, :image, :remove_image)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
