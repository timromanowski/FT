class CreateSportsBars < ActiveRecord::Migration
  def change
    create_table :sports_bars do |t|
      t.string :name
      t.string :hashtag
      t.text   :description
      t.integer :owner_id
      t.timestamps null: false
    end
  end
end
