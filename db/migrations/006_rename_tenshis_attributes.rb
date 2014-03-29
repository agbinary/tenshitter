class RenameTenshisAttributes < ActiveRecord::Migration
  def change
    rename_column :tenshis, :reply_id, :in_reply_to
    rename_column :tenshis, :retenshi_id, :tenshi_id
  end
end
