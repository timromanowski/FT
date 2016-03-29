class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :sport_bar_id
      t.string :name
      t.text :location_description
      t.string :logo
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.float  :latitude
      t.float  :longitude
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :facebook_page
      t.string :twitter_handle
      t.integer :tv_count
      t.string :permalink
      t.timestamps null: false
    end
  end
end
