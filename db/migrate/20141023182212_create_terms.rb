class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.references :vocabulary, index: true
      t.string :name
      t.string :language

      t.timestamps
    end
  end
end
