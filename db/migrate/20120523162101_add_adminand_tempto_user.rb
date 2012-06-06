class AddAdminandTemptoUser < ActiveRecord::Migration
  def up
    add_column :users, :is_admin, :boolean, default: :false
    add_column :users, :is_temp, :boolean, default: :true
  end

  def down
  end
end
