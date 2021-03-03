class RemoveLikesFromTitles < ActiveRecord::Migration[6.0]
  def change
    remove_column :titles, :likes, :integer
  end
end
