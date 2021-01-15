class LaligaPostsController < ApplicationController
  # 投稿一覧
  def index
    @laliga_posts = LaligaPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def new
  end

  #投稿内容保存
  def create
    @laliga_posts = LaligaPost.create(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました"

      redirect_to laliga_posts_url
    else
      flash[:danger] = "投稿に失敗しました"
      render "/new"
    end
  end

  private

  def post_params
    params.require(:laliga_post).permit(:name, :text, :image, :remove_image)
  end
end
