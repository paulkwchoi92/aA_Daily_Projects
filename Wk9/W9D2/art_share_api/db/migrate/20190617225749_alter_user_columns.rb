class AlterUserColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :name
  end
  
  def down
    rename_column :users, :email, :username
  end
end
