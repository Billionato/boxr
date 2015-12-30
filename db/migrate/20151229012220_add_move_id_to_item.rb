class AddMoveIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :move_id, :integer
  end
end
