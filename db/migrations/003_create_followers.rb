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
end