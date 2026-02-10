class CreateQuoteRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :quote_requests do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :vehicle_make, null: false
      t.string :vehicle_model, null: false
      t.integer :vehicle_year
      t.text :issue_description, null: false
      t.text :additional_notes

      t.timestamps
    end
  end
end
