class CreateVocabularyHierarchies < ActiveRecord::Migration
  def change
    create_table :vocabulary_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :vocabulary_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "anc_desc_idx"

    add_index :vocabulary_hierarchies, [:descendant_id],
      name: "desc_idx"
  end
end
