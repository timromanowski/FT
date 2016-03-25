class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.string :name
      t.string :hashtag
      t.text   :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.float  :latitude
      t.float  :longitude
      t.integer :owner_id
      t.integer :chain_id
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
