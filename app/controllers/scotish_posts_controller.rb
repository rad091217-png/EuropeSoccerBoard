class ScotishPostsController < ApplicationController
  before_action :logged_in_user
  # 投稿一覧
  def index
    @scotish_posts = ScotishPost.paginate(page: params[:page])
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
    @scotish_posts = ScotishPost.paginate(page: params[:page]).order(created_at: :desc)
    if @scotish_posts.user_id == current_user.id
      @scotish_posts.destroy
      flash[:success] = "投稿を削除しました"
      redirect_back(fallback_location: "scotish_post/index")
    end
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
end
