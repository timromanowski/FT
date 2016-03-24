class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
       t.string :hashtag
       t.integer :league_id
       t.integer :venue_id
       t.string :location
       t.float :latitude
       t.float :longitude
       t.string :name
       t.string :nickname
       t.string :slug
       t.timestamps null: false
    end
  end
end
