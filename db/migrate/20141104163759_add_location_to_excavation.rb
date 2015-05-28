class AddLocationToExcavation < ActiveRecord::Migration
  def change
    add_column :excavations, :longitude, :float
    add_column :excavations, :latitude, :float
    add_column :excavations, :address, :string
  end
end
