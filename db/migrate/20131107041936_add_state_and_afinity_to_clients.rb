class AddStateAndAfinityToClients < ActiveRecord::Migration
  def change
    add_column :clients, :state, :string
    add_column :clients, :afinity, :string
  end
end
