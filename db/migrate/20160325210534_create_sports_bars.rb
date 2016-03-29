class CreateSportsBars < ActiveRecord::Migration
  def change
    create_table :sports_bars do |t|
      t.string :name
      t.string :hashtag
      t.text   :description
      t.string :logo
      t.integer :owner_id
      t.string :email
      t.string :website
      t.string :facebook_page
      t.string :twitter_handle
      t.string :permalink
      t.timestamps null: false
    end
  end
end
