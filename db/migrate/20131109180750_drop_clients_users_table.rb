class DropClientsUsersTable < ActiveRecord::Migration
  def up
    drop_table :clients_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
