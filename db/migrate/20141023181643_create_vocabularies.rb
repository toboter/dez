class CreateVocabularies < ActiveRecord::Migration
  def change
    create_table :vocabularies do |t|
      t.string :record_type
      t.integer :parent_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps
    end
  end
end
