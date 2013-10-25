class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :client
      t.string :brand
      t.string :model
      t.string :version
      t.string :year

      t.timestamps
    end
    add_index :vehicles, :client_id
  end
end
