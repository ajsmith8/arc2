class AndyLikesBoys < ActiveRecord::Migration
  def up
    add_column :ts, :majority, :string
    remove_column :ts, :political
    remove_column :users, :political_view
  end

  def down
  end
end
