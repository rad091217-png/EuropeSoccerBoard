class LaligaPostsController < ApplicationController
  # 投稿一覧
  def index
    @laliga_posts = LaligaPost.paginate(page: params[:page])
    @laliga_post_like = Laliga_post_Like.new
  end

  #投稿作成画面
  def new
    @laliga_post = current_user.laliga_posts.build()
  end

  #投稿内容保存
  def create
    @laliga_post = current_user.laliga_posts.build(post_params)
    if @laliga_post.save
      redirect_to laliga_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "laliga_posts/new"
    end
  end

  private

  def post_params
    params.require(:laliga_post).permit(:title, :text, :image, :remove_image)
  end
end
