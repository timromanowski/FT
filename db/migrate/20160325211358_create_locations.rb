class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :sport_bar_id
      t.text :location_description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.float  :latitude
      t.float  :longitude
      t.timestamps null: false
    end
  end
end
