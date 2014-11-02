<<<<<<< HEAD
class RenamePasswordToPasswordHash < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_hash
  end
end
=======
class RenamePasswordToPasswordHash < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_hash
  end
end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
