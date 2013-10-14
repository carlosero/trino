class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :status
      t.timestamp :agenda
      t.text :comment

      t.timestamps
    end
  end
end
