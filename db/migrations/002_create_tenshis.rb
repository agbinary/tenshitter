<<<<<<< HEAD
class CreateTenshis < ActiveRecord::Migration
  def change
    create_table :tenshis do |t|
      t.text :message
      t.references :user
      t.references :retenshi
      t.references :reply
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :tenshis, :user_id
    add_index :tenshis, :retenshi_id
    add_index :tenshis, :reply_id
  end
=======
class CreateTenshis < ActiveRecord::Migration
  def change
    create_table :tenshis do |t|
      t.text :message
      t.references :user
      t.references :retenshi
      t.references :reply
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :tenshis, :user_id
    add_index :tenshis, :retenshi_id
    add_index :tenshis, :reply_id
  end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
end