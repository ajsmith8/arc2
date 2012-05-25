class Add4ColumnsToTempActivities < ActiveRecord::Migration
  def up
    add_column :temp_activities, :quiz1, :boolean
    add_column :temp_activities, :quiz2, :boolean
    add_column :temp_activities, :quiz3, :boolean
    add_column :temp_activities, :quiz4, :boolean
  end

  def down
  end
end
