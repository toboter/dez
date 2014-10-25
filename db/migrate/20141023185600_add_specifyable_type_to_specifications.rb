class AddSpecifyableTypeToSpecifications < ActiveRecord::Migration
  def change
  	add_column :specifications, :specifyable_type, :string

  	add_index :specifications, :specifyable_type
  end
end
