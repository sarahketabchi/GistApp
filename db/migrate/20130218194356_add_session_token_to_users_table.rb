class AddSessionTokenToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string
  end
end