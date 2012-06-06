class AddPoliticalViewToUser < ActiveRecord::Migration
  def change
    add_column :users, :political_view, :string
  end
end
