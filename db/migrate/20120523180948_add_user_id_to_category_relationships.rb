class AddUserIdToCategoryRelationships < ActiveRecord::Migration
  def change
    add_column :category_relationships, :user_id, :integer
  end
end
