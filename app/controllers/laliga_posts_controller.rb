class LaligaPostController < ApplicationController
  # 投稿一覧
  def index
    @post = Post.order("created_at DESC").page(params[:page]).per(20)
  end

  #投稿作成画面
  def new
  end

  #投稿内容保存
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました"

      redirect_to laliga_post_url
    else
      flash[:danger] = "投稿に失敗しました"
      render "laliga_new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :text, :image, :remove_image)
  end
end
