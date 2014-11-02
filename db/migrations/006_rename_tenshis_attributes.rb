<<<<<<< HEAD
class RenameTenshisAttributes < ActiveRecord::Migration
  def change
    rename_column :tenshis, :reply_id, :in_reply_to
    rename_column :tenshis, :retenshi_id, :tenshi_id
  end
end
=======
class RenameTenshisAttributes < ActiveRecord::Migration
  def change
    rename_column :tenshis, :reply_id, :in_reply_to
    rename_column :tenshis, :retenshi_id, :tenshi_id
  end
end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
