class AddNameIndexToLeagues < ActiveRecord::Migration[5.0]
  def change
    add_index :leagues, :name
  end
end
