class CreateArtefactIdentificators < ActiveRecord::Migration
  def change
    create_table :artefact_identificators do |t|
      t.string :name
      t.string :ident_type
      t.integer :excavation_id
      t.integer :artefact_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps
    end
  end
end
