class AddColumnRoomIdToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :room_id, :integer
  end
end
