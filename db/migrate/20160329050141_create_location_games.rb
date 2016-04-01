class CreateLocationGames < ActiveRecord::Migration
  def change
    create_table :location_games do |t|
      t.integer :location_id
      t.integer :game_id
      t.timestamps null: false
    end
  end
end
