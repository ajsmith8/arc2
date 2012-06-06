class CreateCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :category_relationships do |t|
      t.integer :category_id
      t.integer :t_id

      t.timestamps
    end
  end
end
