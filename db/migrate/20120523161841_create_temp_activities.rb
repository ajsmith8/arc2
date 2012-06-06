class CreateTempActivities < ActiveRecord::Migration
  def change
    create_table :temp_activities do |t|
      t.integer :user_id
      t.string :political_view
      t.string :categories
      t.integer :t1_id
      t.integer :t2_id
      t.string :friend_question1
      t.string :friend_question2
      t.string :friend_question3
      t.string :friend_question4
      t.string :why_fail1
      t.string :why_fail2

      t.timestamps
    end
  end
end
