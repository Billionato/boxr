class AddMoveIdToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :move_id, :integer
  end
end
