class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :abbreviation
            t.string :city
            t.string :country
            t.string :field_type
            t.float :latitude
            t.float :longitude
            t.string :name
            t.string :slug
            t.string :state
            t.string :time_zone
      t.timestamps null: false
    end
  end
end
