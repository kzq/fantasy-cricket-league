class AddCountryIndexToLeagues < ActiveRecord::Migration[5.0]
  def change
    add_index :leagues, :country
  end
end
