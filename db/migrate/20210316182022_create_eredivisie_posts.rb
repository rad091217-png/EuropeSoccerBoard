class CreateEredivisiePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :eredivisie_posts do |t|
      t.string :titile
      t.text :text
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
