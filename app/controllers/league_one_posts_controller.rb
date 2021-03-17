class LeagueOnePostsController < ApplicationController
  # 投稿一覧
  def index
    @league_one_posts = LeagueOnePost.paginate(page: params[:page])
  end

  #投稿作成画面
  def show
    @league_one_post = current_user.league_one_posts.build()
  end

  def new
    @league_one_post = LeagueOnePost.new
  end

  #投稿内容保存
  def create
    @league_one_post = current_user.league_one_posts.build(post_params)
    if @league_one_post.save
      redirect_to league_one_posts_url
      flash[:success] = "投稿に成功しました"
    else
      flash.now[:danger] = "タイトルとコメント両方入力してください"
      render "league_one_posts/new"
    end
  end

  private

  def post_params
    params.require(:league_one_post).permit(:title, :text, :image, :remove_image)
  end
end
