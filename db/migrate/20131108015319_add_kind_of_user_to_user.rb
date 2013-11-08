class AddKindOfUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :kind_of_user, :string
  end
end
