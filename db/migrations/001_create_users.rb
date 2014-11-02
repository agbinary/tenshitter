<<<<<<< HEAD
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
=======
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
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
end