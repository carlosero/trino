class AddFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :document_id, :string
    add_column :clients, :marital_status, :string
    add_column :clients, :expiration_date, :timestamp
  end
end
