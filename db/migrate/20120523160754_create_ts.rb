class CreateTs < ActiveRecord::Migration
  def change
    create_table :ts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :score
      t.string :categories
      t.string :political

      t.timestamps
    end
  end
end
