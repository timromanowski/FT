class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :stattleship_id
      t.string :name
      t.string :slug
      t.string :abbreviation
      t.string :sport       
      t.timestamps null: false
    end
  end
end
