class RenameUserNameToUsername < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :username
  end
end
