class AddColumnTolaligaPost < ActiveRecord::Migration[6.0]
  def change
    add_column :laliga_posts, :like, :integer
  end
end
