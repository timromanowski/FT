class CreateLocationSportsSubscriptions < ActiveRecord::Migration
  def change
    create_table :location_sports_subscriptions do |t|
      t.integer :location_id
      t.integer :sports_subscription_id
      t.timestamps null: false
    end
  end
end
