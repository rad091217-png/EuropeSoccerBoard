class AddLikesToLaligaPost < ActiveRecord::Migration[6.0]
  def change
    add_column :laliga_posts, :likes, :integer
  end
end
