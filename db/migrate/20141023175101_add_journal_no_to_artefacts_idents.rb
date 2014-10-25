class AddJournalNoToArtefactsIdents < ActiveRecord::Migration
  def change
  	remove_column :artefact_identificators, :ident_type
  	add_column :artefact_identificators, :fjno, :string
  end
end
