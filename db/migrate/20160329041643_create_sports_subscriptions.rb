class CreateSportsSubscriptions < ActiveRecord::Migration
  def change
    create_table :sports_subscriptions do |t|
      t.string :name
      t.string :logo_file
      t.string :provider
      t.integer :league_id
      t.timestamps null: false
    end
  end
end
