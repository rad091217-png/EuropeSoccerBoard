class RemoveLikesFromTitles < ActiveRecord::Migration[6.0]
  def change
    remove_column :laliga_posts, :likes, :integer
  end
end
