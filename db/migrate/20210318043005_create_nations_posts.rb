class CreateNationsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :nations_posts do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
