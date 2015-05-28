class AddImageUidToArtefact < ActiveRecord::Migration
  def change
    add_column :artefacts, :image_uid, :string
  end
end
