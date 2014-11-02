<<<<<<< HEAD
class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :follower
      t.references :following
      t.timestamps
    end
    add_index :followers, :follower_id
    add_index :followers, :following_id
  end
=======
class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :follower
      t.references :following
      t.timestamps
    end
    add_index :followers, :follower_id
    add_index :followers, :following_id
  end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
end