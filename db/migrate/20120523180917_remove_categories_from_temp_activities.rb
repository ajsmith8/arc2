class RemoveCategoriesFromTempActivities < ActiveRecord::Migration
  def up
    remove_column :temp_activities, :categories
  end

  def down
  end
end
