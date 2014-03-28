class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :user_name
      t.datetime :deleted_at
      t.timestamps
    end
  end
end