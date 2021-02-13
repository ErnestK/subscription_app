class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
        t.references :base_currency, null: false
        t.references :quote_currency, null: false
        # decimal for correct divisions
        t.decimal :price, null: false

        t.timestamps    
    end

    # contraint for uniq combination
    add_index :rates, [:base_currency_id, :quote_currency_id], :unique => true
  end
end
