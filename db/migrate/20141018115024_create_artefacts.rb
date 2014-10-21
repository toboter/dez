class CreateArtefacts < ActiveRecord::Migration
  def change
    create_table :artefacts do |t|
      t.integer :dez
      t.string  :dez_index
      t.string  :dimensions
      t.integer :dimensions_type
      t.string  :weight
      t.integer :creator_id
      t.integer :updater_id
      t.boolean :in_exhibition

      t.timestamps
    end
  end
end
