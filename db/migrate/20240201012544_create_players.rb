class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :jersey_number
      t.boolean :injuried
      t.references :team, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
