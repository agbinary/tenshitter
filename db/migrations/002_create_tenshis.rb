class CreateTenshis < ActiveRecord::Migration
  def change
    create_table :tenshis do |t|
      t.text :message
      t.references :user
      t.datetime :date
      t.string :deleted_at
      t.datetime deleted_at
      t.references :retenshi
      t.references :reply
    end
    add_index :tenshis, :user_id
    add_index :tenshis, :retenshi
    add_index :tenshis, :reply
  end
end