class AddKuehneCategoriesToArtefacts < ActiveRecord::Migration
  def change
    add_column :artefacts, :state_of_preservation, :string
    add_column :dispositions, :location, :string
    add_column :artefacts, :drawing_uid, :string
    add_column :artefacts, :publications, :text
  end
end
