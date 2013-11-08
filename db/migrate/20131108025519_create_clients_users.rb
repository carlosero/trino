class CreateClientsUsers < ActiveRecord::Migration
  def change
    create_table :clients_users, :id => false do |t|
      t.references :client, :null => false
      t.references :user, :null => false
    end

    # Adding the index can massively speed up join tables. Don't use the
    # unique if you allow duplicates.
    add_index(:clients_users, [:client_id, :user_id], :unique => true)
  end

end
