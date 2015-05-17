class CreateUserZones < ActiveRecord::Migration
  def change
    create_table :user_zones do |t|
      t.string :name
      t.integer :user_id
      t.integer :zone_id

      t.timestamps null: false
    end
  end
end
