class AddStattleShipIds < ActiveRecord::Migration
  def change
     add_column :teams, :stattleship_id, :string
     add_column :games, :stattleship_id, :string
     add_column :venues, :stattleship_id, :string
  end
end
