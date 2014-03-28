class CreateFollowers
  def change
    create_table :followers do |t|
      t.references :follower
      t.references :following
    end
    add_index :followers, :follower_id
    add_index :followers, :following_id
  end
end