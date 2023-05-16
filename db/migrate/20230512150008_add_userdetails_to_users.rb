class AddUserdetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text
    add_column :users, :instagram, :string
    add_column :users, :twitter, :string
  end
end
