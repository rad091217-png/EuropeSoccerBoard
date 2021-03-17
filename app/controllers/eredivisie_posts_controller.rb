class EredivisiePostsController < ApplicationController
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
      render "eredivisie_post/new"
    end
  end

  private

  def post_params
    params.require(:eredivisie_post).permit(:title, :text, :image, :remove_image)
  end
end
