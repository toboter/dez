class CreateDispositions < ActiveRecord::Migration
  def change
    create_table :dispositions do |t|
      t.datetime :receipt_date
      t.integer :artefact_id

      t.timestamps
    end
  end
end
