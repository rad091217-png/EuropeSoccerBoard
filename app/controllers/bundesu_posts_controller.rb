class BundesuPostsController < ApplicationController
  # 投稿一覧
  def index
    @bundesu_posts = BundesuPost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @bundesu_post = current_user.bundesu_posts.build()
  end

  def new
    @bundesu_post = BundesuPost.new
  end

  #投稿内容保存
  def create
    @bundesu_post = current_user.bundesu_posts.build(post_params)
    if @bundesu_post.save
      redirect_to bundesu_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "bundesu_posts/new"
    end
  end

  private

  def post_params
    params.require(:bundesu_post).permit(:title, :text, :image, :remove_image)
  end
end
