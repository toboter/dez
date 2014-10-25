class RemoveIncorrectCreators < ActiveRecord::Migration
  def change
  	remove_column :comments, :creator_id
  	remove_column :comments, :updater_id
  	remove_column :artefact_identificators, :creator_id
  	remove_column :artefact_identificators, :updater_id
  end
end
