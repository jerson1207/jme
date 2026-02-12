class AddServiceTypeToQuoteRequests < ActiveRecord::Migration[8.1]
  def change
    add_column :quote_requests, :service_type, :string
  end
end
