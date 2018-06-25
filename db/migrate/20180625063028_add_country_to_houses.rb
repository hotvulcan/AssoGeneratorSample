class AddCountryToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :country, :string
  end
end
