class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      # in cents because we dont want to have problems with cents and divisions
      t.bigint :price_usd_cents, null: false

      t.timestamps    
    end

    add_index :subscriptions, :name, :unique => true
  end
end
