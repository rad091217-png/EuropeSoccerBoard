class PremierPostsController < ApplicationController
  # 投稿一覧
  def index
    @premier_posts = PremierPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @premier_post = current_user.premier_posts.build()
  end

  def new
    @premier_post = PremierPost.new
  end

  #投稿内容保存
  def create
    @premier_post = current_user.premier_posts.build(post_params)
    if @premier_post.save
      redirect_to premier_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "premier_posts/new"
    end
  end

  private

  def post_params
    params.require(:premier_post).permit(:title, :text, :image, :remove_image)
  end
end
