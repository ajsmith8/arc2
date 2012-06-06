class RemovePoliticalFromTempActivities < ActiveRecord::Migration
  def up
    remove_column :temp_activities, :political_view
  end

  def down
  end
end
