class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.references :vocabulary, index: true
      t.references :specifyable, index: true

      t.timestamps
    end
  end
end
