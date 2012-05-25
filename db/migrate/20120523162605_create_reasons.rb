class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.integer :t_id
      t.string :question
      t.string :title
      t.text :description
      t.integer :score
      t.boolean :is_pro
      t.string :correct_answer
      t.string :wrong_answer1
      t.string :wrong_answer2
      t.string :wrong_answer3

      t.timestamps
    end
  end
end
