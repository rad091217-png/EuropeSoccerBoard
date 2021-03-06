class RemoveLikeFromLaligaPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :laliga_posts, :like, :integer
  end
end
