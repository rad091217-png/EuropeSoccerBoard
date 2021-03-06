class RemoveLikesFromLaligaPostLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :laliga_post_likes, :likes, :integer
  end
end
