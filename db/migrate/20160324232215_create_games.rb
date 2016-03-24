class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
        t.string  :label
        t.string  :name
        t.string  :slug
        t.string  :title
        t.integer :timestamp
        t.datetime :started_at 
        t.integer :home_team_id
        t.integer :away_team_id
        t.integer :venue_id
      t.timestamps null: false
    end
  end
end
