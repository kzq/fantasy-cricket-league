class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :league, foreign_key: true
      t.string :name
      t.string :country

      t.timestamps
    end
    add_index :players, :name
    add_index :players, :country
  end
end
