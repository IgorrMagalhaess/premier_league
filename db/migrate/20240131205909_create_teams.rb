class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :state
      t.integer :champ_position
      t.boolean :hiring_players

      t.timestamps
    end
  end
end
