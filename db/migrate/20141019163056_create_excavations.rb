class CreateExcavations < ActiveRecord::Migration
  def change
    create_table :excavations do |t|
      t.string :name
      t.integer :dai_gazetter_id
      t.string :shortcut
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps
    end
  end
end
