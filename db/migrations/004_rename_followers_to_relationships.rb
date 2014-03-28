class RenameFollowersToRelationships < ActiveRecord::Migration
  def change
    rename_table :followers, :relationships
  end
end
