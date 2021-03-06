class LaligaPostLikesController < ApplicationController
  def create
    @laliga_post_likes = current_user.laliga_post.likes.create(laliga_post_id: params[:laliga_post_id])
    redirect_back(fallback_location: laliga_posts / index)
  end

  def destroy
    @laliga_post_like = Like.find_by(laliga_post_id: params[:laliga_post_id], user_id: current_user.id)
    @laliga_post_like.destroy
    redirect_back(fallback_location: laliga_posts / index)
  end
end
