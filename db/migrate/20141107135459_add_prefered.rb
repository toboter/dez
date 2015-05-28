class AddPrefered < ActiveRecord::Migration
  def change
  	add_column :terms, :prefered, :boolean
  	add_column :comments, :prefered, :boolean
  end
end
