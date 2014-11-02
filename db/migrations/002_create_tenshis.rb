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
end