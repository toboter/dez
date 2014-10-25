class CreateRestorations < ActiveRecord::Migration
  def change
    create_table :restorations do |t|
      t.datetime :date_of_action
      t.integer :artefact_id

      t.timestamps
    end
  end
end
