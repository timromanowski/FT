class CreateSportsBarsGames < ActiveRecord::Migration
  def change
    create_table :sports_bars_games do |t|
      t.integer :sports_bar_id
      t.integer :game_id
      t.timestamps null: false
    end
  end
end
