class DeleteCategoriesFromT < ActiveRecord::Migration
  def up
    remove_column :ts, :categories
  end

  def down
  end
end
