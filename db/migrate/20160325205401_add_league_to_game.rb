class AddLeagueToGame < ActiveRecord::Migration
  def change
    add_column :games, :league_id, :integer
  end
end
