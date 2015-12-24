class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :from
      t.string :to
      t.string :company

      t.timestamps null: false
    end
  end
end
